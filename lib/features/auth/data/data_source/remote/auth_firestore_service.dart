import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ionic/core/services/data_source/remote/firestore_collection_names.dart';

import '../../models/auth_model.dart';

class AuthFirestoreService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  /// ADD USER
  Future<void> addUser({required AuthModel authModel}) async {
    await firestore
        .collection(FirestoreCollectionNames.users)
        .doc(authModel.id)
        .set(authModel.toJson());
  }

  /// DELETE USER
  Future<void> deleteUser({required String userId}) async {
    await firestore
        .collection(FirestoreCollectionNames.users)
        .doc(userId)
        .delete();
  }

  /// GET USER
  Future<AuthModel?> getUser({required String userId}) async {
    final snapshot =
        await firestore
            .collection(FirestoreCollectionNames.users)
            .doc(userId)
            .get();
    final data = snapshot.data();
    return data != null ? AuthModel.fromJson(data) : null;
  }

  /// UPDATE USER
  Future<void> updateUser({required AuthModel authModel}) async {
    await firestore
        .collection(FirestoreCollectionNames.users)
        .doc(authModel.id)
        .update(authModel.toJson());
  }

  /// Is email Exists -> to check if user already exists (registered)
  Future<bool> isEmailExists(String email) async {
    final snapshot =
        await firestore
            .collection(FirestoreCollectionNames.users)
            .where('email', isEqualTo: email)
            .limit(1)
            .get();
    return snapshot.docs.isNotEmpty;
  }

  Future<void> updateFcmToken({
    required String userId,
    required String fcmToken,
  }) async {
    await firestore
        .collection(FirestoreCollectionNames.users)
        .doc(userId)
        .update({'fcmToken': fcmToken});
  }
}
