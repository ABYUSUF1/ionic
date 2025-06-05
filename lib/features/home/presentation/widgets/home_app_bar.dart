import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:ionic/core/constants/app_assets.dart';
import 'package:ionic/core/utils/functions/is_arabic.dart';
import 'package:ionic/core/widgets/dialog/custom_dialog.dart';
import 'package:ionic/core/widgets/loading/skeleton_loading.dart';
import 'package:ionic/features/auth/presentation/manager/auth/auth_cubit.dart';

import '../../../../core/routing/app_router_name.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SliverAppBar(
      toolbarHeight: 120,
      backgroundColor: theme.colorScheme.surface,
      pinned: true,
      title: Column(
        children: [
          Row(
            children: [
              Image.asset(
                isArabic(context)
                    ? AppAssets.logoIonicLogoAr
                    : AppAssets.logoIonicLogo,
                height: 40,
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(IconsaxPlusLinear.search_normal_1),
                onPressed: () {
                  context.push(AppRouterName.searchRoute);
                },
              ),

              const SizedBox(width: 10),
              BlocBuilder<AuthCubit, AuthState>(
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
              ),
            ],
          ),
          ListTile(
            onTap: () {
              context.push(AppRouterName.defaultAddressRoute);
            },
            leading: Icon(
              IconsaxPlusLinear.location,
              size: 24,
              color: theme.colorScheme.onSurfaceVariant,
            ),
            title: Text(
              "مدينة القاهرة بي مدينة نصر شارع 33 شقة 300",
              style: theme.textTheme.bodyLarge,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Icon(
              IconsaxPlusLinear.arrow_down,
              size: 24,
              color: theme.colorScheme.onSurfaceVariant,
            ),
            contentPadding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }
}
