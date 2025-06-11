import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ionic/core/services/data_source/remote/firestore_collection_names.dart';

import '../../../../core/utils/mixin/auth_guard_mixin.dart';
import '../models/cart_model.dart';

class CartRemoteDataSource with AuthGuardMixin {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<CartModel>> fetchCart() async {
    final snapshot =
        await firestore
            .collection(FirestoreCollectionNames.users)
            .doc(userId)
            .collection(FirestoreCollectionNames.cart)
            .get();

    return snapshot.docs.map((doc) => CartModel.fromJson(doc.data())).toList();
  }

  Future<void> addToCart(CartModel cartModel) async {
    await firestore
        .collection(FirestoreCollectionNames.users)
        .doc(userId)
        .collection(FirestoreCollectionNames.cart)
        .doc(cartModel.productId)
        .set(cartModel.toJson());
  }

  Future<void> removeFromCart(String productId) async {
    await firestore
        .collection(FirestoreCollectionNames.users)
        .doc(userId)
        .collection(FirestoreCollectionNames.cart)
        .doc(productId)
        .delete();
  }
}
