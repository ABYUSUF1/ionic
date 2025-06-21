import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ionic/core/utils/enums/address_type_enum.dart';
import 'package:ionic/features/orders/domain/entity/orders_customer_info.dart';

part 'orders_customer_info_model.freezed.dart';
part 'orders_customer_info_model.g.dart';

@freezed
class OrdersCustomerInfoModel with _$OrdersCustomerInfoModel {
  const factory OrdersCustomerInfoModel({
    required String userId,
    required String fullName,
    required String phoneNumber,
    required String address,
    required AddressTypeEnum addressType,
    required double lat,
    required double lng,
  }) = _OrdersCustomerInfoModel;

  factory OrdersCustomerInfoModel.fromJson(Map<String, dynamic> json) =>
      _$OrdersCustomerInfoModelFromJson(json);
}

extension OrdersCustomerInfoModelX on OrdersCustomerInfoModel {
  // To entity
  OrdersCustomerInfoEntity toEntity() => OrdersCustomerInfoEntity(
    userId: userId,
    fullName: fullName,
    phoneNumber: phoneNumber,
    address: address,
    addressType: addressType,
    lat: lat,
    lng: lng,
  );
}
