import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/routing/app_router_name.dart';
import '../../../../../core/widgets/dialog/custom_dialog.dart';
import '../../../../../core/widgets/loading/skeleton_loading.dart';
import '../../../../auth/presentation/manager/auth/auth_cubit.dart';

class HomeAppBarFavoriteButton extends StatelessWidget {
  const HomeAppBarFavoriteButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        bool isLoading = state.maybeWhen(
          orElse: () => false,
          loading: (_) => true,
        );
        return SkeletonLoading(
          isLoading: isLoading,
          child: IconButton(
            icon: const Icon(IconsaxPlusLinear.heart),
            onPressed:
                isLoading
                    ? null
                    : () {
                      state.whenOrNull(
                        authenticated: (_) {
                          context.push(AppRouterName.favoriteRoute);
                        },
                        unAuthenticated: () {
                          showCustomDialog(
                            context: context,
                            title: "Sign in",
                            subTitle: "Sign in to add to favorites",
                            svgPic:
                                theme.brightness == Brightness.light
                                    ? AppAssets
                                        .illustrationsLoginIllustrationLight
                                    : AppAssets
                                        .illustrationsLoginIllustrationDark,
                            buttonText: "Sign in",
                            onTap: () {
                              context.push(AppRouterName.signInRoute);
                            },
                          );
                        },
                      );
                    },
          ),
        );
      },
    );
  }
}
