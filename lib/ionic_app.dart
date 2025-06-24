import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/core/routing/app_route.dart';
import 'package:ionic/core/services/data_source/local/local_app_settings_service.dart';
import 'package:ionic/core/services/network/network_cubit.dart';
import 'package:ionic/core/services/network/network_widget.dart';
import 'package:ionic/core/theme/app_theme.dart';
import 'package:ionic/core/widgets/empty_state_widget.dart';
import 'package:ionic/features/auth/presentation/manager/auth/auth_cubit.dart';
import 'package:ionic/features/cart/domain/repo/cart_repo.dart';
import 'package:ionic/features/cart/presentation/manager/cubit/cart_cubit.dart';
import 'package:ionic/features/favorite/presentation/manager/cubit/favorite_cubit.dart';
import 'package:ionic/features/orders/domain/repo/orders_repo.dart';
import 'package:ionic/features/orders/presentation/manager/cubit/orders_cubit.dart';
import 'core/services/di/get_it_service.dart';
import 'core/theme/manager/cubit/theme_cubit.dart';
import 'features/address/domain/repo/address_repo.dart';
import 'features/address/presentation/manager/default_address/default_address_cubit.dart';
import 'features/auth/domain/repo/auth_repo.dart';
import 'features/favorite/domain/repo/favorite_repo.dart';
import 'package:ionic/generated/locale_keys.g.dart';

class IonicApp extends StatelessWidget {
  const IonicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NetworkCubit(getIt())),
        BlocProvider(
          create: (context) => ThemeCubit(getIt<LocalAppSettingsService>()),
        ),
        BlocProvider(create: (context) => AuthCubit(getIt<AuthRepo>())),
        BlocProvider(create: (context) => FavoriteCubit(getIt<FavoriteRepo>())),
        BlocProvider(create: (context) => CartCubit(getIt<CartRepo>())),
        BlocProvider(
          create: (context) => DefaultAddressCubit(getIt<AddressRepo>()),
        ),
        BlocProvider(create: (context) => OrdersCubit(getIt<OrdersRepo>())),
      ],
      child: BlocBuilder<ThemeCubit, bool>(
        builder: (context, isDarkMode) {
          return BlocListener<AuthCubit, AuthState>(
            listener: (context, state) async {
              state.maybeWhen(
                orElse: () {},
                authenticated: (authEntity) async {
                  // await getIt<FirebaseMessagingService>().init(authEntity.id);
                },
              );
            },
            child: MaterialApp.router(
              scaffoldMessengerKey: scaffoldMessengerKey,
              debugShowCheckedModeBanner: false,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              theme:
                  isDarkMode
                      ? AppTheme.darkTheme(context)
                      : AppTheme.lightTheme(context),
              themeMode: ThemeMode.system,
              routerConfig: appRouter,
              builder: (context, child) {
                return BlocBuilder<NetworkCubit, NetworkStatus>(
                  builder: (context, state) {
                    if (state == NetworkStatus.disconnected) {
                      return EmptyStateWidget(
                        title: context.tr(LocaleKeys.network_no_internet),
                        subtitle: context.tr(
                          LocaleKeys.network_no_internet_desc,
                        ),
                      );
                    }
                    return BlocListener<NetworkCubit, NetworkStatus>(
                      listener: (context, state) {
                        if (state == NetworkStatus.connected) {
                          showOnlineSnackBar(context);
                        }
                      },
                      child: child!,
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
