import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ionic/core/entities/product_item_entity.dart';
import 'package:ionic/features/cart/domain/repo/cart_repo.dart';

part 'cart_state.dart';
part 'cart_cubit.freezed.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo _cartRepo;
  CartCubit(this._cartRepo) : super(const CartState.initial());

  List<ProductItemEntity> cartProducts = [];

  void addToCart(ProductItemEntity productItemEntity) {
    cartProducts.add(productItemEntity);
    emit(CartState.success(cartProducts));
  }

  void removeFromCart(String productId) {
    cartProducts.removeWhere((element) => element.id == productId);
    emit(CartState.success(cartProducts));
  }

  bool isProductInCart(String productId) =>
      cartProducts.any((element) => element.id == productId);
}
