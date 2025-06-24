import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ionic/core/services/data_source/remote/firestore_collection_names.dart';
import '../../models/auth_model.dart';

class AuthFirestoreService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  /// ADD USER
  Future<void> addUser({required AuthModel authModel}) async {
    await firestore
        .collection(FirestoreCollectionNames.users)
        .doc(authModel.id)
        .set(authModel.toJson());
  }

  /// DELETE USER + DATA (with batch)
  /// Deletes data first and then deletes the user
  Future<void> deleteUserAccountAndData() async {
    final user = firebaseAuth.currentUser;
    if (user == null) return;

    final uid = user.uid;
    final userDocRef = firestore
        .collection(FirestoreCollectionNames.users)
        .doc(uid);

    // All subcollections under users/{uid}
    final subCollections = [
      FirestoreCollectionNames.favorites,
      FirestoreCollectionNames.addresses,
      FirestoreCollectionNames.cart,
      FirestoreCollectionNames.orders,
      FirestoreCollectionNames.recentlyProducts,
    ];

    try {
      // 1. Delete each subcollection in chunks (batch limit = 500)
      for (final collection in subCollections) {
        final subRef = userDocRef.collection(collection);
        final docs = await subRef.get();

        for (int i = 0; i < docs.docs.length; i += 500) {
          final batch = firestore.batch();
          final chunk = docs.docs.skip(i).take(500);

          for (final doc in chunk) {
            batch.delete(doc.reference);
          }

          await batch.commit();
        }
      }

      // 2. Delete user document
      final batch = firestore.batch();
      batch.delete(userDocRef);

      // 3. Delete user from live_locations/{uid} if it exists
      final liveLocationDoc = firestore
          .collection(FirestoreCollectionNames.liveLocations)
          .doc(uid);
      final liveSnapshot = await liveLocationDoc.get();
      if (liveSnapshot.exists) {
        batch.delete(liveLocationDoc);
      }

      await batch.commit();

      // 4. Delete Firebase Auth user
      await user.delete();

      print('✅ All user data and account deleted successfully.');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        print('⚠️ Re-authentication required before deleting user.');
      } else {
        print('❌ FirebaseAuthException: ${e.message}');
      }
    } catch (e) {
      print('❌ Unexpected error during deletion: $e');
    }
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

  /// CHECK IF EMAIL EXISTS
  Future<bool> isEmailExists(String email) async {
    final snapshot =
        await firestore
            .collection(FirestoreCollectionNames.users)
            .where('email', isEqualTo: email)
            .limit(1)
            .get();
    return snapshot.docs.isNotEmpty;
  }

  /// UPDATE FCM TOKEN
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
