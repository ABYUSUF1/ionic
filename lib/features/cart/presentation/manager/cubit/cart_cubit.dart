import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ionic/features/cart/domain/entity/cart_entity.dart';
import 'package:ionic/features/cart/domain/repo/cart_repo.dart';

part 'cart_state.dart';
part 'cart_cubit.freezed.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo _cartRepo;
  CartCubit(this._cartRepo) : super(const CartState.initial()) {
    fetchCart();
  }

  List<CartEntity> cartEntityList = [];
  final Set<String> _productIdsInCart = {};

  Future<void> fetchCart() async {
    if (cartEntityList.isNotEmpty) {
      emit(CartState.success(cartEntityList));
      return;
    }

    emit(const CartState.loading());
    final result = await _cartRepo.fetchCart();
    result.fold((l) => emit(CartState.error(l.errMessage)), (r) {
      cartEntityList = r;
      if (cartEntityList.isEmpty) {
        emit(const CartState.empty());
      } else {
        _productIdsInCart.addAll(cartEntityList.map((e) => e.productId));
        emit(CartState.success(cartEntityList));
      }
    });
  }

  void addToCart(CartEntity cartEntity) {
    cartEntityList.add(cartEntity);
    _productIdsInCart.add(cartEntity.productId);
    _cartRepo.addToCart(cartEntity);
    emit(CartState.success(List.from(cartEntityList)));
  }

  void removeFromCart(String productId) {
    cartEntityList.removeWhere((e) => e.productId == productId);
    _productIdsInCart.remove(productId);
    _cartRepo.removeFromCart(productId);
    emit(
      cartEntityList.isEmpty
          ? const CartState.empty()
          : CartState.success(List.from(cartEntityList)),
    );
  }

  bool isProductInCart(String productId) =>
      _productIdsInCart.contains(productId);
}
