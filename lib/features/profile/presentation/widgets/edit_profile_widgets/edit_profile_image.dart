import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:ionic/core/services/image_picker/image_picker_helper.dart';

import '../../manager/cubit/edit_profile_cubit.dart';

class EditProfileImage extends StatelessWidget {
  const EditProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<EditProfileCubit, EditProfileState>(
      builder: (context, state) {
        final cubit = context.read<EditProfileCubit>();
        final photoUrl = state.maybeWhen(
          initial: (_, authEntity) => authEntity?.photoUrl,
          success: (authEntity) => authEntity.photoUrl,
          error: (_) => cubit.photoUrl,
          orElse: () => cubit.photoUrl,
        );

        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Stack(
            children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: theme.colorScheme.secondary,
                backgroundImage:
                    cubit.imageFile != null
                        ? FileImage(cubit.imageFile!)
                        : (photoUrl != null && photoUrl.startsWith('http'))
                        ? CachedNetworkImageProvider(photoUrl)
                        : null,
                child:
                    (cubit.imageFile == null &&
                            (photoUrl == null || !photoUrl.startsWith('http')))
                        ? Icon(
                          IconsaxPlusLinear.user,
                          size: 60,
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
                  icon: const Icon(
                    IconsaxPlusBold.gallery_edit,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
