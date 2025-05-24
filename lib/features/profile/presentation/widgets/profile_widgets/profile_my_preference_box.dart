import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:ionic/core/widgets/snackbar/app_snackbar.dart';
import 'package:ionic/features/auth/presentation/manager/auth/auth_cubit.dart';
import 'package:ionic/generated/locale_keys.g.dart';

import '../../../../../core/routing/app_router_name.dart';
import 'custom_profile_box.dart';
import 'custom_profile_list_tile.dart';

class ProfileMyPreferenceBox extends StatelessWidget {
  const ProfileMyPreferenceBox({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomProfileBox(
      title: context.tr(LocaleKeys.profile_my_preference),
      children: [
        CustomProfileListTile(
          title: LocaleKeys.edit_profile_title.tr(),
          icon: IconsaxPlusLinear.user_edit,
          onTap: () {
            final user = context.read<AuthCubit>().cachedAuthEntity;
            if (user == null || user.isEmailVerified == false) {
              AppSnackbar.showNoteSnackBar(context, "Sign in first");
            } else {
              context.pushNamed(AppRouterName.editProfileRoute);
            }
          },
        ),
        CustomProfileListTile(
          title: context.tr(LocaleKeys.profile_my_cart),
          icon: IconsaxPlusLinear.bag_2,
          onTap: () {},
        ),
        CustomProfileListTile(
          title: LocaleKeys.profile_my_orders.tr(),
          icon: IconsaxPlusLinear.box,
          onTap: () {},
        ),
        CustomProfileListTile(
          title: LocaleKeys.profile_my_addresses.tr(),
          icon: IconsaxPlusLinear.location,
          onTap: () {},
        ),
      ],
    );
  }
}
