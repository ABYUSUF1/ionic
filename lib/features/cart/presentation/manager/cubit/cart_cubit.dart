import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ionic/features/cart/domain/entity/cart_entity.dart';
import 'package:ionic/features/cart/domain/repo/cart_repo.dart';

import '../../../domain/entity/cart_order_summary.dart';
import '../../../domain/entity/cart_product_entity.dart';

part 'cart_state.dart';
part 'cart_cubit.freezed.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo _cartRepo;

  CartCubit(this._cartRepo) : super(const CartState.initial()) {
    fetchCart();
  }

  CartEntity cartEntity = const CartEntity(cartProductsEntity: []);
  final Set<String> _productIdsInCart = {};
  final Map<String, Timer> _debounceTimers = {};

  String? appliedCoupon;
  double couponDiscount = 0;

  bool _hasSyncedLocalCart = false;

  Future<void> syncLocalCartToRemote() async {
    if (_hasSyncedLocalCart) return;
    _hasSyncedLocalCart = true;

    final result = await _cartRepo.syncLocalCartToRemote();
    result.fold((l) => emit(CartState.error(l.errMessage)), (syncedCartEntity) {
      cartEntity = syncedCartEntity;
      _productIdsInCart
        ..clear()
        ..addAll(
          cartEntity.cartProductsEntity.map((e) => e.productItem.productId),
        );
      if (cartEntity.cartProductsEntity.isEmpty) {
        emit(const CartState.empty());
      } else {
        emitSuccess();
      }
    });
  }

  void emitSuccess() {
    final summary = CartOrderSummary.fromCart(
      cart: cartEntity,
      couponDiscount: couponDiscount,
    );
    emit(CartState.success(cartEntity, summary));
  }

  Future<void> fetchCart() async {
    if (cartEntity.cartProductsEntity.isNotEmpty) {
      emitSuccess();
      return;
    }

    emit(const CartState.loading());

    final result = await _cartRepo.fetchCart();
    result.fold((l) => emit(CartState.error(l.errMessage)), (r) {
      cartEntity = r;
      if (cartEntity.cartProductsEntity.isEmpty) {
        emit(const CartState.empty());
      } else {
        _productIdsInCart.addAll(
          cartEntity.cartProductsEntity.map((e) => e.productItem.productId),
        );
        emitSuccess();
      }
    });
  }

  void addToCart(CartProductEntity cartProduct) {
    final updatedList = List<CartProductEntity>.from(
      cartEntity.cartProductsEntity,
    )..add(cartProduct);

    cartEntity = CartEntity(cartProductsEntity: updatedList);
    _productIdsInCart.add(cartProduct.productItem.productId);
    _cartRepo.addToCart(cartProduct);
    emitSuccess();
  }

  void removeFromCart(String productId) {
    final updatedList =
        cartEntity.cartProductsEntity
            .where((e) => e.productItem.productId != productId)
            .toList();

    cartEntity = CartEntity(cartProductsEntity: updatedList);
    _productIdsInCart.remove(productId);
    _cartRepo.removeFromCart(productId);

    if (cartEntity.cartProductsEntity.isEmpty) {
      emit(const CartState.empty());
    } else {
      emitSuccess();
    }
  }

  void clearCart() {
    cartEntity = const CartEntity(cartProductsEntity: []);
    _productIdsInCart.clear();
    _cartRepo.clearCart();
    _hasSyncedLocalCart = false;
    emit(const CartState.empty());
  }

  bool isProductInCart(String productId) =>
      _productIdsInCart.contains(productId);

  void incrementQuantity(String productId) {
    _updateQuantity(productId, increase: true);
  }

  void decrementQuantity(String productId) {
    _updateQuantity(productId, increase: false);
  }

  void _updateQuantity(String productId, {required bool increase}) {
    final index = cartEntity.cartProductsEntity.indexWhere(
      (e) => e.productItem.productId == productId,
    );
    if (index == -1) return;

    final currentItem = cartEntity.cartProductsEntity[index];
    final newQuantity =
        increase
            ? currentItem.quantity + 1
            : currentItem.quantity > 1
            ? currentItem.quantity - 1
            : 1;

    final updatedItem = currentItem.copyWith(quantity: newQuantity);
    final updatedList = List<CartProductEntity>.from(
      cartEntity.cartProductsEntity,
    )..[index] = updatedItem;

    cartEntity = CartEntity(cartProductsEntity: updatedList);
    emitSuccess();

    _debounceTimers[productId]?.cancel();
    _debounceTimers[productId] = Timer(
      const Duration(milliseconds: 500),
      () async {
        await _cartRepo.addToCart(updatedItem);
        _debounceTimers.remove(productId);
      },
    );
  }

  void applyCoupon(String code) {
    if (cartEntity.cartProductsEntity.isEmpty) return;

    if (code.length == 4 && appliedCoupon != code) {
      appliedCoupon = code;
      couponDiscount = 25.0;
      emitSuccess();
    }
  }

  void removeCoupon() {
    appliedCoupon = null;
    couponDiscount = 0;
    emitSuccess();
  }

  @override
  Future<void> close() {
    for (final timer in _debounceTimers.values) {
      timer.cancel();
    }
    return super.close();
  }
}
