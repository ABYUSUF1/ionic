import 'package:go_router/go_router.dart';
import 'package:ionic/core/routing/app_router_name.dart';
import 'package:ionic/features/address/data/models/address_model.dart';
import 'package:ionic/features/address/domain/entity/address_entity.dart';
import 'package:ionic/features/address/presentation/views/save_address.dart';
import 'package:ionic/features/address/presentation/views/default_address_view.dart';
import 'package:ionic/features/address/presentation/views/locate_on_map_view.dart';
import 'package:ionic/features/auth/presentation/args/email_sent_args.dart';
import 'package:ionic/features/auth/presentation/views/email_sent_view.dart';
import 'package:ionic/features/auth/presentation/views/forget_password_view.dart';
import 'package:ionic/features/auth/presentation/views/sign_in_view.dart';
import 'package:ionic/features/auth/presentation/views/sign_up_view.dart';
import 'package:ionic/features/cart/presentation/views/cart_view.dart';
import 'package:ionic/features/home/data/models/category_model/localized_title.dart';
import 'package:ionic/features/home/presentation/views/home_view.dart';
import 'package:ionic/features/product/presentation/views/product_view.dart';
import 'package:ionic/features/profile/presentation/views/edit_profile_view.dart';
import 'package:ionic/features/profile/presentation/views/profile_view.dart';
import 'package:ionic/main_bottom_nav_bar.dart';

import '../../features/categories/presentation/views/categories_view.dart';
import '../../features/checkout/presentation/views/checkout_view.dart';
import '../../features/favorite/presentation/views/favorite_view.dart';
import '../../features/onboarding/presentation/views/onboarding_view.dart';
import '../../features/search/presentation/views/search_view.dart';
import '../models/product_model/product.dart';
import '../services/data_source/local/local_app_settings_service.dart';
import '../services/di/get_it_service.dart';

final GoRouter appRouter = GoRouter(
  initialLocation:
      getIt<LocalAppSettingsService>().settings.isFirstTime
          ? AppRouterName.onboardingRoute
          : AppRouterName.homeRoute,

  debugLogDiagnostics: true,

  routes: [
    // --------------------- Onboarding ---------------------
    GoRoute(
      path: AppRouterName.onboardingRoute,
      builder: (context, state) => const OnboardingView(),
    ),

    /// --------------------- Auth ---------------------
    GoRoute(
      path: AppRouterName.signInRoute,
      builder: (context, state) => const SignInView(),
    ),
    GoRoute(
      path: AppRouterName.signUpRoute,
      builder: (context, state) => const SignUpView(),
    ),
    GoRoute(
      path: AppRouterName.forgetPasswordRoute,
      builder: (context, state) {
        final email = state.extra as String?;
        return ForgetPasswordView(email: email);
      },
    ),
    GoRoute(
      path: AppRouterName.emailSentRoute,
      builder: (context, state) {
        final data = state.extra as EmailSentArgs;
        return EmailSentView(emailSentArgs: data);
      },
    ),

    /// --------------------- Home ---------------------
    StatefulShellRoute.indexedStack(
      builder:
          (context, state, navigationShell) =>
              MainBottomNavBar(navigationShell: navigationShell),

      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRouterName.homeRoute,
              name: AppRouterName.homeRoute,
              builder: (context, state) => const HomeView(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRouterName.cartRoute,
              builder: (context, state) => const CartView(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRouterName.cartRoute,
              builder: (context, state) => const CartView(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRouterName.profileRoute,
              name: AppRouterName.profileRoute,
              builder: (context, state) => const ProfileView(),
              routes: [
                GoRoute(
                  path: AppRouterName.editProfileRoute,
                  name: AppRouterName.editProfileRoute,
                  builder: (context, state) => const EditProfileView(),
                ),
              ],
            ),
          ],
        ),
      ],
    ),

    /// --------------------- Product ---------------------
    GoRoute(
      path: AppRouterName.productRoute,
      name: AppRouterName.productRoute,

      builder: (context, state) {
        final String productId = state.pathParameters['productId'] ?? '';

        final extra = state.extra;
        Product? product;

        if (extra is Product) {
          product = extra;
        } else if (extra is Map<String, dynamic>) {
          // When change device from devicePreview the object convert to Map
          // and we need to convert it back to Product
          //? Why this happens? --> I DONT KNOW
          product = Product.fromJson(extra);
        } else {
          product = null;
        }

        return ProductView(productId: productId, product: product);
      },
    ),

    /// --------------------- Categories ---------------------
    GoRoute(
      path: AppRouterName.categoriesRoute,
      name: AppRouterName.categoriesRoute,
      builder: (context, state) {
        late final LocalizedTitle categoryName;
        final extra = state.extra;
        if (extra is! LocalizedTitle) {
          categoryName = LocalizedTitle.fromJson(extra as Map<String, dynamic>);
        } else {
          categoryName = extra;
        }

        return CategoriesView(categoryName: categoryName);
      },
    ),

    /// --------------------- Favorite ---------------------
    GoRoute(
      path: AppRouterName.favoriteRoute,
      name: AppRouterName.favoriteRoute,
      builder: (context, state) => const FavoriteView(),
    ),

    /// --------------------- Search ---------------------
    GoRoute(
      path: AppRouterName.searchRoute,
      name: AppRouterName.searchRoute,
      builder: (context, state) => const SearchView(),
    ),

    /// --------------------- Address ---------------------
    GoRoute(
      path: AppRouterName.defaultAddressRoute,
      name: AppRouterName.defaultAddressRoute,
      builder: (context, state) => const DefaultAddressView(),
    ),
    GoRoute(
      path: AppRouterName.locateOnMapRoute,
      name: AppRouterName.locateOnMapRoute,
      builder: (context, state) => const LocateOnMapView(),
    ),
    GoRoute(
      path: AppRouterName.saveAddressRoute,
      name: AppRouterName.saveAddressRoute,
      builder: (context, state) {
        late final AddressEntity addressEntity;
        final extra = state.extra;
        if (extra is! AddressEntity) {
          AddressModel model = AddressModel.fromJson(
            extra as Map<String, dynamic>,
          );
          addressEntity = model.toEntity();
        } else {
          addressEntity = extra;
        }
        return SaveAddressView(addressEntity: addressEntity);
      },
    ),

    /// --------------------- Checkout ---------------------
    GoRoute(
      path: AppRouterName.checkoutRoute,
      name: AppRouterName.checkoutRoute,
      builder: (context, state) => const CheckoutView(),
    ),
  ],
);
