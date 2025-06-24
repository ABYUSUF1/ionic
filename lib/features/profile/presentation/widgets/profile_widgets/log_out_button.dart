import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:ionic/core/widgets/buttons/custom_outline_button.dart';
import 'package:ionic/core/widgets/responsive_layout.dart';
import 'package:ionic/features/auth/presentation/manager/auth/auth_cubit.dart';
import 'package:ionic/features/profile/presentation/manager/tablet_ui_logic/cubit/tablet_ui_logic_cubit.dart';
import 'package:ionic/generated/locale_keys.g.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = ResponsiveLayout.isMobile(context);
    return SliverToBoxAdapter(
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return state.maybeWhen(
            unAuthenticated: () => const SizedBox.shrink(),
            orElse:
                () => Padding(
                  padding: EdgeInsetsDirectional.only(
                    start: 16.0,
                    top: 16,
                    bottom: 16,
                    end: isMobile ? 16 : 0,
                  ),
                  child: CustomOutlineButton(
                    text: LocaleKeys.auth_sign_out.tr(),
                    color: theme.colorScheme.error,
                    icon: IconsaxPlusLinear.logout,
                    onPressed: state.maybeWhen(
                      loading: (_) => null,
                      orElse: () {
                        return () async {
                          if (!isMobile) {
                            context.read<TabletUiLogic>().reset();
                          }
                          await context.read<AuthCubit>().signOut(context);
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
