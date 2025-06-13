import 'package:ionic/features/cart/data/models/cart_model.dart';
import '../../../../core/entities/product_item_entity.dart';

class CartEntity {
  final ProductItemEntity productItemEntity;
  final String returnPolicy;
  final int quantity;

  const CartEntity({
    required this.productItemEntity,
    required this.returnPolicy,
    required this.quantity,
  });

  // to model
  CartModel toModel() => CartModel(
    quantity: quantity,
    productItemModel: productItemEntity.toProductItemModel(),
    returnPolicy: returnPolicy,
  );

  // copy with
  CartEntity copyWith({
    String? title,
    String? imageUrl,
    String? brand,
    double? price,
    double? discount,
    String? returnPolicy,
    int? deliveryDays,
    int? quantity,
  }) {
    return CartEntity(
      productItemEntity: ProductItemEntity(
        productId: productItemEntity.productId,
        title: title ?? productItemEntity.title,
        imageUrl: imageUrl ?? productItemEntity.imageUrl,
        price: price ?? productItemEntity.price,
        rating: productItemEntity.rating,
        stock: productItemEntity.stock,
        reviewsCount: productItemEntity.reviewsCount,
        brand: brand ?? productItemEntity.brand,
        discount: discount ?? productItemEntity.discount,
        deliveryDays: deliveryDays ?? productItemEntity.deliveryDays,
      ),
      returnPolicy: returnPolicy ?? this.returnPolicy,
      quantity: quantity ?? this.quantity,
    );
  }

  // Loading
  static CartEntity loading() => CartEntity(
    productItemEntity: ProductItemEntity.loading(),
    quantity: 0,
    returnPolicy: 'Loading return policy ......',
  );
}
