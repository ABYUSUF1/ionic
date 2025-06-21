import 'package:dartz/dartz.dart';
import 'package:ionic/core/utils/errors/failure.dart';
import 'package:ionic/features/orders/domain/entity/orders_entity.dart';

abstract class OrdersRepo {
  Future<Either<Failure, List<OrdersEntity>>> fetchOrders();

  Future<Either<Failure, String>> addOrder(
    OrdersEntity ordersEntity,
  ); // return order Id
}
