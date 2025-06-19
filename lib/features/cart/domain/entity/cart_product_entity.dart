import 'package:ionic/core/entities/product_item_entity.dart';

class CartProductEntity {
  final ProductItemEntity productItem;
  final String returnPolicy;
  final int quantity;

  const CartProductEntity({
    required this.productItem,
    required this.returnPolicy,
    required this.quantity,
  });

  CartProductEntity copyWith({
    ProductItemEntity? productItem,
    String? returnPolicy,
    int? quantity,
  }) {
    return CartProductEntity(
      productItem: productItem ?? this.productItem,
      returnPolicy: returnPolicy ?? this.returnPolicy,
      quantity: quantity ?? this.quantity,
    );
  }

  // Loading
  static CartProductEntity loading() {
    return CartProductEntity(
      productItem: ProductItemEntity.loading(),
      returnPolicy: 'return policy loading ...',
      quantity: 0,
    );
  }
}
