import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ionic/core/services/data_source/remote/firestore_collection_names.dart';

import '../../../../core/utils/mixin/auth_guard_mixin.dart';
import '../models/cart_model.dart';

class CartRemoteDataSource with AuthGuardMixin {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<CartModel> fetchCart() async {
    final snapshot =
        await firestore
            .collection(FirestoreCollectionNames.users)
            .doc(userId)
            .collection(FirestoreCollectionNames.cart)
            .get();

    return CartModel.fromJson(snapshot.docs.first.data());
  }

  Future<void> addToCart(CartModel cartModel) async {
    await firestore
        .collection(FirestoreCollectionNames.users)
        .doc(userId)
        .collection(FirestoreCollectionNames.cart)
        .add(cartModel.toJson());
  }

  Future<void> removeFromCart(String cartId) async {
    await firestore
        .collection(FirestoreCollectionNames.users)
        .doc(userId)
        .collection(FirestoreCollectionNames.cart)
        .doc(cartId)
        .delete();
  }

  Future<void> updateCart(CartModel cartModel) async {
    await firestore
        .collection(FirestoreCollectionNames.users)
        .doc(userId)
        .collection(FirestoreCollectionNames.cart)
        .doc(cartModel.cartId)
        .update(cartModel.toJson());
  }
}
