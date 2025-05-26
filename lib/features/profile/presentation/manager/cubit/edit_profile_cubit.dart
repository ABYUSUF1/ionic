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
  final TextEditingController emailController =
      TextEditingController(); // Not editable
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  String? gender;
  DateTime? birthdate;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late AuthEntity originalAuthEntity;

  void init(AuthEntity authEntity) {
    photoUrl = authEntity.photoUrl;
    emailController.text = authEntity.email;
    firstNameController.text = authEntity.firstName;
    lastNameController.text = authEntity.lastName;
    phoneNumberController.text = authEntity.phoneNumber ?? '';
    gender = authEntity.gender;
    birthdate = authEntity.birthDate;

    originalAuthEntity = authEntity;

    emit(EditProfileState.initial(canSubmit: false, authEntity: authEntity));
  }

  void onPhotoChanged(File newImageFile) {
    imageFile = newImageFile;
    photoUrl = newImageFile.path;
    emit(
      EditProfileState.initial(
        canSubmit: photoUrl != originalAuthEntity.photoUrl,
        authEntity: originalAuthEntity.copyWith(photoUrl: photoUrl),
      ),
    );
  }

  void onNameChanged() {
    emit(
      EditProfileState.initial(
        canSubmit:
            firstNameController.text != originalAuthEntity.firstName ||
            lastNameController.text != originalAuthEntity.lastName,

        authEntity: originalAuthEntity.copyWith(
          firstName: firstNameController.text,
          lastName: lastNameController.text,
        ),
      ),
    );
  }

  void onPhoneChanged() {
    emit(
      EditProfileState.initial(
        canSubmit: phoneNumberController.text != originalAuthEntity.phoneNumber,
        authEntity: originalAuthEntity.copyWith(
          phoneNumber: phoneNumberController.text,
        ),
      ),
    );
  }

  void onBirthDateChanged() {
    emit(
      EditProfileState.initial(
        canSubmit: birthdate != originalAuthEntity.birthDate,
        authEntity: originalAuthEntity.copyWith(birthDate: birthdate),
      ),
    );
  }

  void onGenderChanged() {
    emit(
      EditProfileState.initial(
        canSubmit: gender != originalAuthEntity.gender,
        authEntity: originalAuthEntity.copyWith(gender: gender),
      ),
    );
  }

  Future<void> saveChanges() async {
    if (formKey.currentState!.validate()) {
      if (!state.maybeWhen(
        orElse: () => false,
        initial: (canSubmit, _) => canSubmit,
      )) {
        return;
      }

      final newAuthEntity = originalAuthEntity.copyWith(
        photoUrl: photoUrl,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        phoneNumber: phoneNumberController.text,
        gender: gender,
        birthDate: birthdate,
      );

      emit(const EditProfileState.loading());
      // Save Changes..
      final result = await _editProfileRepo.updateUser(
        authModel: newAuthEntity.toModel(),
      );

      result.fold(
        (failure) => emit(EditProfileState.error(failure.errMessage)),
        (_) => emit(EditProfileState.success(newAuthEntity)),
      );
    }
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
