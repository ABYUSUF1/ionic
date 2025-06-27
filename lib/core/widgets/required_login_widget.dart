import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ionic/core/constants/app_assets.dart';
import 'package:ionic/core/routing/app_router_name.dart';
import 'package:ionic/core/widgets/buttons/custom_filled_button.dart';
import 'package:ionic/core/widgets/buttons/custom_outline_button.dart';
import 'package:ionic/core/widgets/empty_state_widget.dart';
import 'package:ionic/core/widgets/loading/full_screen_loading.dart';
import 'package:ionic/features/auth/presentation/manager/auth/auth_cubit.dart';

import '../../generated/locale_keys.g.dart';

class RequiredLoginScreen extends StatelessWidget {
  final String appBarTitle;
  final String description;
  final Widget child;
  const RequiredLoginScreen({
    super.key,
    required this.appBarTitle,
    required this.child,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () => null,
          loading: (message) => showFullScreenLoading(context, message),
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          error:
              (message) => EmptyStateWidget(
                svgImage:
                    isDarkMode
                        ? AppAssets.illustrationsErrorIllustrationDark
                        : AppAssets.illustrationsErrorIllustrationLight,
                title: context.tr(LocaleKeys.common_something_went_wrong),
                subtitle: message,
              ),
          orElse: () {
            return Scaffold(
              backgroundColor: theme.colorScheme.surface,
              appBar: AppBar(
                title: Text(appBarTitle, style: theme.textTheme.headlineMedium),
              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 600),
                      child: Column(
                        spacing: 16,
                        children: [
                          EmptyStateWidget(
                            svgImage:
                                isDarkMode
                                    ? AppAssets
                                        .illustrationsLoginIllustrationDark
                                    : AppAssets
                                        .illustrationsLoginIllustrationLight,
                            title: context.tr(LocaleKeys.auth_sign_in_required),
                            subtitle: description,
                          ),
                          CustomOutlineButton(
                            text: context.tr(
                              LocaleKeys.auth_continue_with_google,
                            ),
                            svgIcon: AppAssets.iconsGoogle,
                            onPressed: () async {
                              await context.read<AuthCubit>().signInWithGoogle(
                                context,
                              );
                            },
                          ),
                          CustomFilledButton(
                            text: context.tr(LocaleKeys.common_sign_in_up),
                            onPressed: () {
                              context.push(AppRouterName.signInRoute);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          authenticated: (authEntity) {
            return child;
          },
        );
      },
    );
  }
}
