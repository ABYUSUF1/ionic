import 'package:flutter/material.dart';
import 'package:ionic/features/profile/presentation/widgets/edit_profile_widgets/custom_edit_profile_box.dart';

import 'custom_edit_profile_list_tile.dart';

class EditProfileAdditionalInfoBox extends StatelessWidget {
  const EditProfileAdditionalInfoBox({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomEditProfileBox(
      title: "Additional Information",
      child: Column(
        spacing: 20,
        children: [
          CustomEditProfileListTile(
            title: "Gender",
            content: "Male",
            canEdit: false,
          ),
          CustomEditProfileListTile(title: "Birth Date", content: "12/12/1999"),
        ],
      ),
    );
  }
}
