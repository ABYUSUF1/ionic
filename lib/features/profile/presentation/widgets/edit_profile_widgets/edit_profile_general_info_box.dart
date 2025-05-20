import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionic/core/widgets/snackbar/app_snackbar.dart';
import 'package:ionic/features/profile/presentation/widgets/edit_profile_widgets/custom_edit_profile_box.dart';

import '../../../../../core/routing/app_router_name.dart';
import 'custom_edit_profile_list_tile.dart';

class EditProfileGeneralInfoBox extends StatelessWidget {
  final String fullName;
  final String email;
  final String? phoneNumber;
  const EditProfileGeneralInfoBox({
    super.key,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return CustomEditProfileBox(
      title: "General Information",
      child: Column(
        spacing: 20,
        children: [
          CustomEditProfileListTile(
            title: "Full Name",
            content: fullName,
            onTap: () => context.pushNamed(AppRouterName.changeFullNameRoute),
          ),
          CustomEditProfileListTile(
            title: "E-Mail",
            content: email,
            canEdit: false,
            onTap:
                () =>
                    AppSnackbar.showNoteSnackBar(context, "Cannot edit email"),
          ),
          CustomEditProfileListTile(
            title: "Phone Number",
            content: phoneNumber ?? "Not set",
            onTap:
                () => context.pushNamed(AppRouterName.changePhoneNumberRoute),
          ),
        ],
      ),
    );
  }
}
