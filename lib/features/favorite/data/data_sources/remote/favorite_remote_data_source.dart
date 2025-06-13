import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ionic/core/models/product_item_model.dart';
import 'package:ionic/core/services/data_source/remote/firestore_collection_names.dart';
import 'package:ionic/core/utils/mixin/auth_guard_mixin.dart';

class FavoriteRemoteDataSource with AuthGuardMixin {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addFavorite(ProductItemModel productItemModel) async {
    await _firestore
        .collection(FirestoreCollectionNames.users)
        .doc(userId)
        .collection(FirestoreCollectionNames.favorites)
        .doc(productItemModel.productId)
        .set(productItemModel.toJson());
  }

  Future<void> removeFavorite(String productId) async {
    await _firestore
        .collection(FirestoreCollectionNames.users)
        .doc(userId)
        .collection(FirestoreCollectionNames.favorites)
        .doc(productId)
        .delete();
  }

  Future<List<ProductItemModel>> fetchFavorites() async {
    final snapshot =
        await _firestore
            .collection(FirestoreCollectionNames.users)
            .doc(userId)
            .collection(FirestoreCollectionNames.favorites)
            .get();
    return snapshot.docs
        .map((doc) => ProductItemModel.fromJson(doc.data()))
        .toList();
  }
}
