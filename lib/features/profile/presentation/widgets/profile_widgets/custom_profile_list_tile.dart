import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/core/theme/app_colors.dart';
import 'package:ionic/core/widgets/responsive_layout.dart';
import 'package:ionic/generated/locale_keys.g.dart';
import '../../../../../core/widgets/snackbar/app_snackbar.dart';
import '../../../../auth/presentation/manager/auth/auth_cubit.dart';
import '../../manager/tablet_ui_logic/cubit/tablet_ui_logic_cubit.dart';

class CustomProfileListTile extends StatelessWidget {
  const CustomProfileListTile({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
    this.section,
    this.requireAuth = false,
  });

  final String title;
  final IconData icon;
  final VoidCallback? onTap;
  final ProfileButtonEnum? section;
  final bool requireAuth;

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileChild: _MobileVersion(
        title: title,
        icon: icon,
        onTap: onTap,
        requireAuth: requireAuth,
      ),
      tabletChild: _TabletVersion(
        title: title,
        icon: icon,
        onTap: onTap,
        section: section,
        requireAuth: requireAuth,
      ),
    );
  }
}

class _MobileVersion extends StatelessWidget {
  const _MobileVersion({
    required this.title,
    required this.icon,
    required this.requireAuth,
    this.onTap,
  });

  final String title;
  final IconData icon;
  final VoidCallback? onTap;
  final bool requireAuth;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      leading: Icon(icon, size: 28),
      title: Text(title, style: theme.textTheme.bodyMedium),
      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
      onTap: () {
        if (requireAuth && !_checkAuth(context)) {
          return; // Stop here if not authenticated
        }
        onTap?.call(); // Otherwise continue
      },
    );
  }
}

class _TabletVersion extends StatelessWidget {
  const _TabletVersion({
    required this.title,
    required this.icon,
    required this.requireAuth,
    this.onTap,
    this.section,
  });

  final String title;
  final IconData icon;
  final VoidCallback? onTap;
  final ProfileButtonEnum? section;
  final bool requireAuth;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final isSelected = context.select(
      (TabletUiLogic cubit) => section != null && section == cubit.state,
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Material(
        color:
            isSelected
                ? AppColors.primaryColor.withValues(alpha: .2)
                : Colors.transparent,
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: isSelected ? 8 : 0),
          leading: Icon(
            icon,
            size: 28,
            color: isSelected ? theme.colorScheme.primary : null,
          ),
          title: Text(
            title,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? theme.colorScheme.primary : null,
            ),
          ),
          trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
          onTap: () {
            if (requireAuth && !_checkAuth(context)) {
              return;
            }

            if (section != null) {
              context.read<TabletUiLogic>().select(section!);
            } else {
              onTap?.call();
            }
          },
        ),
      ),
    );
  }
}

bool _checkAuth(BuildContext context) {
  final user = context.read<AuthCubit>().cachedAuthEntity;
  if (user == null || !user.isEmailVerified) {
    AppSnackbar.showNoteSnackBar(
      context,
      context.tr(LocaleKeys.address_sign_in_required),
    );
    return false; // not authenticated
  }
  return true; // authenticated
}
