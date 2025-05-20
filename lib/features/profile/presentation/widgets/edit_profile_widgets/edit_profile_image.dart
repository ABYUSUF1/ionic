import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class EditProfileImage extends StatelessWidget {
  final String? photoUrl;
  const EditProfileImage({super.key, required this.photoUrl});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundColor: theme.colorScheme.secondary,
            backgroundImage:
                photoUrl == null ? null : CachedNetworkImageProvider(photoUrl!),
            child:
                photoUrl == null
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
              onPressed: () {},
              icon: Icon(IconsaxPlusBold.gallery_edit, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
