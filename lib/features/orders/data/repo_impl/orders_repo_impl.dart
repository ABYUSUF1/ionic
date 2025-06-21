import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';
import 'package:ionic/core/services/data_source/remote/firestore_collection_names.dart';
import 'package:ionic/core/utils/errors/failure.dart';
import 'package:ionic/core/utils/mixin/auth_guard_mixin.dart';
import 'package:ionic/features/orders/domain/entity/orders_entity.dart';
import 'package:ionic/features/orders/data/models/orders_model.dart';
import '../../domain/repo/orders_repo.dart';

class OrdersRepoImpl with AuthGuardMixin implements OrdersRepo {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<Either<Failure, String>> addOrder(OrdersEntity ordersEntity) async {
    try {
      // Step 1: Get today's date for counter key
      final String today = DateFormat('yyyy-MM-dd').format(DateTime.now());
      final DocumentReference counterRef = firestore
          .collection(FirestoreCollectionNames.ordersCounter)
          .doc(today);

      // Step 2: Use Firestore transaction to safely increment and get orderId
      final String newOrderId = await firestore.runTransaction((
        transaction,
      ) async {
        final DocumentSnapshot counterDoc = await transaction.get(counterRef);

        int nextOrderNumber;
        if (!counterDoc.exists) {
          nextOrderNumber = 1; // First order today
        } else {
          final data = counterDoc.data() as Map<String, dynamic>;
          final int currentNumber = data['lastOrderNumber'];

          if (currentNumber >= 9999) {
            throw Exception("Maximum daily order limit reached.");
          }

          nextOrderNumber = currentNumber + 1;
        }

        // Update the counter document (merge to keep future fields safe)
        transaction.set(counterRef, {
          'lastOrderNumber': nextOrderNumber,
        }, SetOptions(merge: true));

        // Return formatted orderId, e.g., "#ORD-2025-06-21-0001"
        final formattedOrderNumber = nextOrderNumber.toString().padLeft(4, '0');
        return '#ORD-$today-$formattedOrderNumber';
      });

      // Step 3: Add the order with orderId and createdAt
      final completeOrderEntity = ordersEntity.copyWith(
        orderId: newOrderId,
        placedAt: DateTime.now(),
      );

      await firestore
          .collection(FirestoreCollectionNames.users)
          .doc(userId)
          .collection(FirestoreCollectionNames.orders)
          .doc() // Let Firestore generate unique doc ID
          .set(completeOrderEntity.toModel().toJson());

      return Right(newOrderId);
    } catch (e) {
      return Left(Failure("Could not place order: ${e.toString()}"));
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
