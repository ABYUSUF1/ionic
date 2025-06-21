import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/orders_product_entity.dart';

part 'orders_product_model.freezed.dart';
part 'orders_product_model.g.dart';

@freezed
class OrdersProductModel with _$OrdersProductModel {
  const factory OrdersProductModel({
    required String productId,
    required String name,
    required String imageUrl,
    required String brand,
    required double price,
    required int quantity,
    required String returnPolicy,
  }) = _OrdersProductModel;

  factory OrdersProductModel.fromJson(Map<String, dynamic> json) =>
      _$OrdersProductModelFromJson(json);
}

extension OrdersProductModelX on OrdersProductModel {
  OrdersProductEntity toEntity() => OrdersProductEntity(
    productId: productId,
    name: name,
    imageUrl: imageUrl,
    brand: brand,
    price: price,
    quantity: quantity,
    returnPolicy: returnPolicy,
  );
}
