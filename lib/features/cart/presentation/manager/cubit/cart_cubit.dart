import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ionic/core/utils/functions/product_formatted.dart';
import 'package:ionic/features/cart/domain/entity/cart_entity.dart';
import 'package:ionic/features/cart/domain/repo/cart_repo.dart';

import '../../../domain/entity/cart_order_summary.dart';

part 'cart_state.dart';
part 'cart_cubit.freezed.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo _cartRepo;
  CartCubit(this._cartRepo) : super(const CartState.initial()) {
    fetchCart();
  }

  List<CartEntity> cartEntityList = [];
  final Set<String> _productIdsInCart = {};
  final Map<String, Timer> _debounceTimers = {}; // for rapid quantity updates

  double get subtotal => cartEntityList.fold(
    0.0,
    (total, e) => total + e.productItemEntity.price * e.quantity,
  );

  int get totalQuantity =>
      cartEntityList.fold(0, (total, e) => total + e.quantity);

  double get shippingFee {
    final hasAtLeastOneNonFreeItem = cartEntityList.any(
      (cart) => !isFreeDelivery(cart.productItemEntity.price),
    );
    return hasAtLeastOneNonFreeItem ? 25.0 : 0.0;
  }

  double couponDiscount = 0.0; // Will update this later

  double get totalPrice => subtotal + shippingFee - couponDiscount;

  void emitSuccess() {
    emit(
      CartState.success(
        List.from(cartEntityList),
        CartOrderSummary(
          totalQuantity: totalQuantity,
          shippingFee: shippingFee,
          couponDiscount: couponDiscount,
          totalPrice: totalPrice,
          subTotal: subtotal,
        ),
      ),
    );
  }

  Future<void> fetchCart() async {
    if (cartEntityList.isNotEmpty) {
      emitSuccess();
      return;
    }

    emit(const CartState.loading());
    final result = await _cartRepo.fetchCart();
    result.fold((l) => emit(CartState.error(l.errMessage)), (r) {
      cartEntityList = r;
      if (cartEntityList.isEmpty) {
        emit(const CartState.empty());
      } else {
        _productIdsInCart.addAll(
          cartEntityList.map((e) => e.productItemEntity.productId),
        );
        emitSuccess();
      }
    });
  }

  void addToCart(CartEntity cartEntity) {
    cartEntityList.add(cartEntity);
    _productIdsInCart.add(cartEntity.productItemEntity.productId);
    _cartRepo.addToCart(cartEntity);
    emitSuccess();
  }

  void removeFromCart(String productId) {
    cartEntityList.removeWhere(
      (e) => e.productItemEntity.productId == productId,
    );
    _productIdsInCart.remove(productId);
    _cartRepo.removeFromCart(productId);
    if (cartEntityList.isEmpty) {
      emit(const CartState.empty());
    } else {
      emitSuccess();
    }
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
    final index = cartEntityList.indexWhere(
      (e) => e.productItemEntity.productId == productId,
    );
    if (index == -1) return;

    final currentItem = cartEntityList[index];
    final newQuantity =
        increase
            ? currentItem.quantity + 1
            : currentItem.quantity > 1
            ? currentItem.quantity - 1
            : 1;

    // Update local UI Optimistically
    final updatedItem = currentItem.copyWith(quantity: newQuantity);
    final newList = List<CartEntity>.from(cartEntityList)
      ..[index] = updatedItem;
    cartEntityList = newList;
    emitSuccess();

    // Debounce Firestore update
    _debounceTimers[productId]?.cancel();
    _debounceTimers[productId] = Timer(
      const Duration(milliseconds: 500),
      () async {
        await _cartRepo.addToCart(updatedItem);
        _debounceTimers.remove(productId);
      },
    );
  }

  String? appliedCoupon;

  void applyCoupon(String code) {
    if (code.length == 4 && appliedCoupon != code) {
      appliedCoupon = code;
      couponDiscount = 25.0; // apply EGP 25 discount
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
