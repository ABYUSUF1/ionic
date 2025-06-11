import 'package:ionic/features/cart/data/models/cart_model.dart';

class CartEntity {
  final String productId;
  final String title;
  final String imageUrl;
  final String brand;
  final double price;
  final double discount;
  final String returnPolicy;
  final int deliveryDays;
  final int quantity;

  const CartEntity({
    required this.productId,
    required this.title,
    required this.imageUrl,
    required this.brand,
    required this.price,
    required this.discount,
    required this.returnPolicy,
    required this.deliveryDays,
    required this.quantity,
  });

  CartModel toModel() => CartModel(
    productId: productId,
    title: title,
    imageUrl: imageUrl,
    brand: brand,
    price: price,
    discount: discount,
    returnPolicy: returnPolicy,
    deliveryDays: deliveryDays,
    quantity: quantity,
  );

  // copy with
  CartEntity copyWith({
    String? title,
    String? imageUrl,
    String? brand,
    double? price,
    double? discount,
    String? returnPolicy,
    int? quantity,
  }) {
    return CartEntity(
      productId: productId,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      brand: brand ?? this.brand,
      price: price ?? this.price,
      discount: discount ?? this.discount,
      returnPolicy: returnPolicy ?? this.returnPolicy,
      deliveryDays: deliveryDays,
      quantity: quantity ?? this.quantity,
    );
  }

  // Loading
  static CartEntity loading() => const CartEntity(
    productId: '',
    title: 'Loading Title ...',
    imageUrl: '',
    brand: 'Loading',
    price: 0,
    discount: 0,
    returnPolicy: 'Loading return policy .....',
    deliveryDays: 0,
    quantity: 0,
  );
}
