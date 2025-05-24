import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:ionic/core/widgets/buttons/custom_outline_button.dart';
import 'package:ionic/features/auth/presentation/manager/auth/auth_cubit.dart';
import 'package:ionic/generated/locale_keys.g.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverToBoxAdapter(
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return state.maybeWhen(
            unAuthenticated: () => const SizedBox.shrink(),

            orElse:
                () => Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CustomOutlineButton(
                    text: LocaleKeys.auth_sign_out.tr(),
                    color: theme.colorScheme.error,
                    icon: IconsaxPlusLinear.logout,
                    onPressed: state.maybeWhen(
                      loading: (_) => null,
                      orElse: () {
                        return () async {
                          await context.read<AuthCubit>().signOut();
                        };
                      },
                    ),
                  ),
                ),
          );
        },
      ),
    );
  }
}
