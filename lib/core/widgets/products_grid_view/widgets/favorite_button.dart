import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:ionic/core/constants/app_assets.dart';
import 'package:ionic/core/widgets/dialog/custom_dialog.dart';
import 'package:ionic/core/widgets/loading/skeleton_loading.dart';
import 'package:ionic/features/auth/presentation/manager/auth/auth_cubit.dart';
import 'package:ionic/features/favorite/presentation/manager/cubit/favorite_cubit.dart';

import '../../../entities/product_item_entity.dart';
import '../../../routing/app_router_name.dart';

class FavoriteButton extends StatelessWidget {
  final ProductItemEntity productItem;
  const FavoriteButton({super.key, required this.productItem});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return state.maybeWhen(
          unAuthenticated:
              () => IconButton(
                onPressed: () {
                  showCustomDialog(
                    context: context,
                    title: "Sign in",
                    subTitle: "Sign in to add to favorites",
                    svgPic:
                        theme.brightness == Brightness.light
                            ? AppAssets.illustrationsLoginIllustrationLight
                            : AppAssets.illustrationsLoginIllustrationDark,
                    buttonText: "Sign in",
                    onTap: () {
                      context.push(AppRouterName.signInRoute);
                    },
                  );
                },
                icon: const Icon(IconsaxPlusBold.heart),
              ),
          orElse:
              () => const SkeletonLoading(
                isLoading: true,
                child: Icon(IconsaxPlusBold.heart),
              ),
          authenticated:
              (_) => BlocBuilder<FavoriteCubit, FavoriteState>(
                builder: (context, state) {
                  final cubit = context.read<FavoriteCubit>();
                  final isFavorite = cubit.isFavorite(productItem.productId);
                  return IconButton(
                    icon: Icon(
                      isFavorite
                          ? IconsaxPlusBold.heart
                          : IconsaxPlusBold.heart,
                      color:
                          isFavorite
                              ? theme.colorScheme.error
                              : theme.colorScheme.onSurfaceVariant,
                    ),
                    onPressed: () {
                      cubit.toggleFavorites(productItem, context);
                    },
                  );
                },
              ),
        );
      },
    );
  }
}
