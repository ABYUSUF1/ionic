import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ionic/core/services/data_source/remote/firestore_collection_names.dart';
import 'package:ionic/features/cart/data/models/cart_product_remote_model.dart';
import 'package:ionic/features/cart/data/models/cart_remote_model.dart';

import '../../../../core/utils/mixin/auth_guard_mixin.dart';

class CartRemoteDataSource with AuthGuardMixin {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<CartRemoteModel> fetchCart() async {
    final snapshot =
        await firestore
            .collection(FirestoreCollectionNames.users)
            .doc(userId)
            .collection(FirestoreCollectionNames.cart)
            .get();

    final products =
        snapshot.docs
            .map((doc) => CartProductRemoteModel.fromJson(doc.data()))
            .toList();

    return CartRemoteModel(cartProducts: products);
  }

  Future<void> addToCart(CartProductRemoteModel cartProductModel) async {
    await firestore
        .collection(FirestoreCollectionNames.users)
        .doc(userId)
        .collection(FirestoreCollectionNames.cart)
        .doc(cartProductModel.productItem.productId)
        .set(cartProductModel.toJson());
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
