import 'package:flutter/material.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverAppBar(
      pinned: true,
      floating: false,
      expandedHeight: 250,
      elevation: 5,
      shadowColor: Colors.black,
      backgroundColor: theme.colorScheme.surface,
      surfaceTintColor: theme.colorScheme.surface,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          final isCollapsed =
              constraints.maxHeight <=
              kToolbarHeight + MediaQuery.of(context).padding.top + 10;
          return FlexibleSpaceBar(
            titlePadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            title:
                isCollapsed
                    ? Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: theme.colorScheme.secondary,
                        ),
                        const SizedBox(width: 16),
                        Text(
                          "User Name",
                          style: theme.textTheme.titleLarge!.copyWith(
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
                    radius: 70,
                    backgroundColor: theme.colorScheme.secondary,
                  ),
                  const SizedBox(height: 16),
                  Text('User Name', style: theme.textTheme.headlineMedium),
                  Text(
                    "ym2250420@gmail.com",
                    style: theme.textTheme.bodyMedium!.copyWith(
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
