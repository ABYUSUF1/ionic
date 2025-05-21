import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:ionic/core/utils/image_picker/image_picker_helper.dart';

import '../../manager/cubit/edit_profile_cubit.dart';

class EditProfileImage extends StatelessWidget {
  const EditProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cubit = context.read<EditProfileCubit>();

    final photoUrl = cubit.state.maybeWhen(
      initial: (_, authEntity) => authEntity?.photoUrl,
      orElse: () => cubit.photoUrl,
    );

    final imageFile = cubit.imageFile;

    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundColor: theme.colorScheme.secondary,
            backgroundImage:
                imageFile != null
                    ? FileImage(imageFile) as ImageProvider
                    : photoUrl != null
                    ? CachedNetworkImageProvider(photoUrl)
                    : null,
            child:
                photoUrl == null && imageFile == null
                    ? Icon(
                      IconsaxPlusLinear.user,
                      color: theme.colorScheme.onSurfaceVariant,
                    )
                    : null,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: IconButton.filled(
              onPressed: () async {
                final imageFile = await ImagePickerHelper.showImagePicker(
                  context: context,
                );
                if (imageFile != null) {
                  cubit.onPhotoChanged(imageFile);
                }
              },
              icon: Icon(IconsaxPlusBold.gallery_edit, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
