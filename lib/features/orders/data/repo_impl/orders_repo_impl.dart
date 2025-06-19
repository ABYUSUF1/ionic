import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:ionic/core/services/data_source/remote/firestore_collection_names.dart';

import 'package:ionic/core/utils/errors/failure.dart';
import 'package:ionic/core/utils/mixin/auth_guard_mixin.dart';
import 'package:ionic/features/orders/data/models/orders_model.dart';

import 'package:ionic/features/orders/domain/entity/orders_entity.dart';

import '../../domain/repo/orders_repo.dart';

class OrdersRepoImpl with AuthGuardMixin implements OrdersRepo {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<Either<Failure, void>> addOrder(OrdersEntity ordersEntity) async {
    try {
      await firestore
          .collection(FirestoreCollectionNames.users)
          .doc(userId)
          .collection(FirestoreCollectionNames.orders)
          .doc() // generate id automatically
          .set(ordersEntity.toModel().toJson());

      return const Right(null);
    } catch (e) {
      print(e.toString());
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<OrdersEntity>>> fetchOrders() async {
    try {
      final snapshot =
          await firestore
              .collection(FirestoreCollectionNames.users)
              .doc(userId)
              .collection(FirestoreCollectionNames.orders)
              .get();

      final ordersList =
          snapshot.docs
              .map((doc) => OrdersModel.fromJson(doc.data()).toEntity())
              .toList();

      return Right(ordersList);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
