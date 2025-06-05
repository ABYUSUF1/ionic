import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ionic/core/services/data_source/remote/firestore_collection_names.dart';
import 'package:ionic/core/utils/mixin/auth_guard_mixin.dart';

import '../models/address_model.dart';

class AddressRemoteDataSource with AuthGuardMixin {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addAddress(AddressModel addressModel) async {
    await firestore
        .collection(FirestoreCollectionNames.users)
        .doc(userId)
        .collection(FirestoreCollectionNames.addresses)
        .add(addressModel.toJson());
  }

  Future<void> updateAddress(AddressModel addressModel) async {
    await firestore
        .collection(FirestoreCollectionNames.users)
        .doc(userId)
        .collection(FirestoreCollectionNames.addresses)
        .doc(addressModel.id)
        .update(addressModel.toJson());
  }

  Future<void> deleteAddress(String addressId) async {
    await firestore
        .collection(FirestoreCollectionNames.users)
        .doc(userId)
        .collection(FirestoreCollectionNames.addresses)
        .doc(addressId)
        .delete();
  }

  Future<List<AddressModel>> getAddresses() async {
    final snapshot =
        await firestore
            .collection(FirestoreCollectionNames.users)
            .doc(userId)
            .collection(FirestoreCollectionNames.addresses)
            .get();

    return snapshot.docs
        .map((doc) => AddressModel.fromJson(doc.data()))
        .toList();
  }
}
