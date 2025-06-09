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
        .doc(addressModel.id)
        .set(addressModel.toJson());
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
            // Sort: default address comes before non-default addresses
            .orderBy('isDefault', descending: true)
            .get();

    return snapshot.docs
        .map((doc) => AddressModel.fromJson(doc.data()))
        .toList();
  }

  Future<void> setDefaultAddress(String selectedAddressId) async {
    final addressCollection = firestore
        .collection(FirestoreCollectionNames.users)
        .doc(userId)
        .collection(FirestoreCollectionNames.addresses)
        // Sort: default address comes before non-default addresses
        .orderBy('isDefault', descending: true);

    final snapshot = await addressCollection.get();

    final batch = firestore.batch();

    for (final doc in snapshot.docs) {
      final isSelected = doc.id == selectedAddressId;
      batch.update(doc.reference, {'isDefault': isSelected});
    }

    await batch.commit();
  }
}
