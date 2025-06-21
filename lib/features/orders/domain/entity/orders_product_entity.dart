import 'package:ionic/features/orders/data/models/orders_product_model.dart';

class OrdersProductEntity {
  final String productId;
  final String name;
  final String imageUrl;
  final String brand;
  final double price;
  final int quantity;
  final String returnPolicy;

  OrdersProductEntity({
    required this.productId,
    required this.name,
    required this.imageUrl,
    required this.brand,
    required this.price,
    required this.quantity,
    required this.returnPolicy,
  });

  // to Model
  OrdersProductModel toModel() => OrdersProductModel(
    productId: productId,
    name: name,
    imageUrl: imageUrl,
    brand: brand,
    price: price,
    quantity: quantity,
    returnPolicy: returnPolicy,
  );

  // loading
  static OrdersProductEntity loading() => OrdersProductEntity(
    productId: 'ORD-DATE-COUNTER',
    name: 'Loading Loading Loading',
    imageUrl: 'Loading',
    brand: 'Loading',
    price: 0.0,
    quantity: 0,
    returnPolicy: 'Loading Loading Loading Loading',
  );
}
