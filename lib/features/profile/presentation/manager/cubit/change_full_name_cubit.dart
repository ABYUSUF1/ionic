import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ionic/features/auth/domain/entity/auth_entity.dart';
import 'package:ionic/features/profile/domain/repo/edit_profile_repo.dart';

part 'change_full_name_state.dart';
part 'change_full_name_cubit.freezed.dart';

class ChangeFullNameCubit extends Cubit<ChangeFullNameState> {
  final EditProfileRepo _editProfileRepo;
  ChangeFullNameCubit(this._editProfileRepo)
    : super(const ChangeFullNameState.initial());

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final GlobalKey<FormState> changeNameKey = GlobalKey<FormState>();
  late String oldFirstName, oldLastName;

  void init(String firstName, String lastName) {
    oldFirstName = firstNameController.text = firstName;
    oldLastName = lastNameController.text = lastName;

    // Add listeners
    firstNameController.addListener(_checkForChanges);
    lastNameController.addListener(_checkForChanges);
  }

  void _checkForChanges() {
    final isChanged =
        firstNameController.text.trim() != oldFirstName ||
        lastNameController.text.trim() != oldLastName;

    emit(ChangeFullNameState.initial(canSubmit: isChanged));
  }

  Future<void> saveChanges(AuthEntity authEntity) async {
    if (changeNameKey.currentState!.validate()) {
      if (!state.maybeWhen(
        orElse: () => false,
        initial: (canSubmit) => canSubmit,
      )) {
        return;
      }
      emit(const ChangeFullNameState.loading());

      final result = await _editProfileRepo.changeFullName(
        authModel: authEntity.toModel(),
      );

      result.fold(
        (failure) => emit(ChangeFullNameState.error(failure.errMessage)),
        (_) => emit(const ChangeFullNameState.success()),
      );
    }
  }

  @override
  Future<void> close() {
    firstNameController.dispose();
    lastNameController.dispose();
    return super.close();
  }
}
