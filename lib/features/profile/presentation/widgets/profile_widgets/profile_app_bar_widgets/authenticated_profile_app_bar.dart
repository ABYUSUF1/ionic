import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../../../auth/domain/entity/auth_entity.dart';

// Authenticated Profile AppBar
// ------------------------------
class AuthenticatedProfileAppBar extends StatelessWidget {
  final AuthEntity authEntity;

  const AuthenticatedProfileAppBar({super.key, required this.authEntity});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SliverAppBar(
      pinned: true,
      expandedHeight: 220,
      elevation: 5,
      backgroundColor: theme.colorScheme.surface,
      surfaceTintColor: theme.colorScheme.surface,
      shadowColor: Colors.black,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          final isCollapsed =
              constraints.maxHeight <=
              kToolbarHeight + MediaQuery.of(context).padding.top + 10;

          return FlexibleSpaceBar(
            titlePadding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
            title:
                isCollapsed
                    ? Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: theme.colorScheme.secondary,
                          backgroundImage:
                              authEntity.photoUrl?.isNotEmpty == true
                                  ? CachedNetworkImageProvider(
                                    authEntity.photoUrl!,
                                  )
                                  : null,
                          child:
                              authEntity.photoUrl == null
                                  ? Icon(
                                    IconsaxPlusLinear.profile,
                                    size: 25,
                                    color: theme.colorScheme.onSurfaceVariant,
                                  )
                                  : null,
                        ),
                        const SizedBox(width: 16),
                        Text(
                          authEntity.displayName,
                          style: theme.textTheme.titleLarge?.copyWith(
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                      ],
                    )
                    : null,
            background: Container(
              padding: const EdgeInsets.only(top: 16),
              color: theme.colorScheme.surface,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: theme.colorScheme.secondary,

                    backgroundImage:
                        authEntity.photoUrl == null
                            ? null
                            : CachedNetworkImageProvider(authEntity.photoUrl!),
                    child:
                        authEntity.photoUrl == null
                            ? Icon(
                              IconsaxPlusLinear.profile,
                              size: 25,
                              color: theme.colorScheme.onSurfaceVariant,
                            )
                            : null,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    authEntity.displayName,
                    style: theme.textTheme.headlineMedium,
                  ),
                  Text(
                    authEntity.email,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
