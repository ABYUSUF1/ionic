import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/features/auth/domain/entity/auth_entity.dart';
import 'package:ionic/features/auth/presentation/manager/auth/auth_cubit.dart';
import 'package:ionic/features/profile/presentation/widgets/edit_profile_widgets/edit_profile_general_info_box.dart';
import 'package:ionic/features/profile/presentation/widgets/edit_profile_widgets/edit_profile_image.dart';

import '../../../../core/widgets/buttons/custom_back_button.dart';
import '../widgets/edit_profile_widgets/delete_account_button.dart';
import '../widgets/edit_profile_widgets/edit_profile_additional_info_box.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const CustomBackButton(),
            const SizedBox(width: 16),
            Text("Edit Profile", style: theme.textTheme.headlineMedium),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              final authEntity = context.read<AuthCubit>().cachedAuthEntity!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  EditProfileImage(photoUrl: authEntity.photoUrl),
                  SizedBox(height: 30),
                  EditProfileGeneralInfoBox(
                    fullName: authEntity.displayName,
                    email: authEntity.formattedEmail,
                    phoneNumber: authEntity.phoneNumber,
                  ),
                  SizedBox(height: 30),
                  EditProfileAdditionalInfoBox(),
                  SizedBox(height: 30),
                  DeleteAccountButton(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
