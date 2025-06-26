import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ionic/features/auth/domain/entity/auth_entity.dart';
import 'package:ionic/features/profile/domain/repo/edit_profile_repo.dart';

part 'edit_profile_state.dart';
part 'edit_profile_cubit.freezed.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  final EditProfileRepo _editProfileRepo;
  EditProfileCubit(this._editProfileRepo)
    : super(const EditProfileState.initial());

  File? imageFile;
  String? photoUrl;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  String? gender;
  DateTime? birthdate;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late AuthEntity originalAuthEntity;

  bool _isUploadingImage = false;

  void init(AuthEntity authEntity) {
    photoUrl = authEntity.photoUrl;
    emailController.text = authEntity.email;
    firstNameController.text = authEntity.firstName;
    lastNameController.text = authEntity.lastName;
    phoneNumberController.text = authEntity.phoneNumber ?? '';
    gender = authEntity.gender;
    birthdate = authEntity.birthDate;

    originalAuthEntity = authEntity;

    _emitUpdatedState();
  }

  void onPhotoChanged(File newImageFile) {
    imageFile = newImageFile;

    // Assign a temporary placeholder value so `_hasChanges()` returns true
    photoUrl = 'local_image_${DateTime.now().millisecondsSinceEpoch}';

    _emitUpdatedState();
  }

  void onNameChanged() => _emitUpdatedState();

  void onPhoneChanged() => _emitUpdatedState();

  void onBirthDateChanged() => _emitUpdatedState();

  void onGenderChanged() => _emitUpdatedState();

  Future<void> saveChanges() async {
    if (!formKey.currentState!.validate()) return;

    if (!_hasChanges()) {
      emit(const EditProfileState.error('No changes to save.'));
      return;
    }

    emit(const EditProfileState.loading());

    // Upload image first (if any)
    await _uploadImageIfNeeded();

    final updatedEntity = _buildUpdatedEntity();

    final result = await _editProfileRepo.updateUser(
      authModel: updatedEntity.toModel(),
    );

    result.fold(
      (failure) => emit(EditProfileState.error(failure.errMessage)),
      (_) => emit(EditProfileState.success(updatedEntity)),
    );
  }

  AuthEntity _buildUpdatedEntity() {
    return originalAuthEntity.copyWith(
      photoUrl: photoUrl,
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      phoneNumber: phoneNumberController.text,
      gender: gender,
      birthDate: birthdate,
    );
  }

  bool _hasChanges() {
    return photoUrl != originalAuthEntity.photoUrl ||
        firstNameController.text != originalAuthEntity.firstName ||
        lastNameController.text != originalAuthEntity.lastName ||
        phoneNumberController.text != originalAuthEntity.phoneNumber ||
        gender != originalAuthEntity.gender ||
        birthdate != originalAuthEntity.birthDate;
  }

  void _emitUpdatedState() {
    emit(
      EditProfileState.initial(
        canSubmit: _hasChanges(),
        authEntity: _buildUpdatedEntity(),
      ),
    );
  }

  Future<void> _uploadImageIfNeeded() async {
    if (imageFile == null || _isUploadingImage) return;

    _isUploadingImage = true;

    final bytes = await imageFile!.readAsBytes();

    final result = await _editProfileRepo.uploadProfileImage(
      imageBytes: bytes,
      imageName: '${DateTime.now().millisecondsSinceEpoch}.jpg',
    );

    _isUploadingImage = false;

    result.fold((failure) => emit(EditProfileState.error(failure.errMessage)), (
      imageUrl,
    ) {
      photoUrl = imageUrl;
      _emitUpdatedState(); // update entity with final photo URL
    });
  }

  @override
  Future<void> close() {
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneNumberController.dispose();
    return super.close();
  }
}
