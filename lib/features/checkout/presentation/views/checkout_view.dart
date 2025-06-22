import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/core/services/di/get_it_service.dart';
import 'package:ionic/core/widgets/required_login_widget.dart';
import 'package:ionic/core/widgets/responsive_layout.dart';
import 'package:ionic/core/widgets/snackbar/app_snackbar.dart';
import 'package:ionic/features/orders/domain/repo/orders_repo.dart';
import 'package:ionic/features/payment/presentation/manager/cubit/payment_cubit.dart';
import 'package:ionic/generated/locale_keys.g.dart';
import '../manager/cubit/checkout_cubit.dart';
import '../widgets/checkout_mobile_view_body.dart';
import '../widgets/checkout_place_order_button.dart';
import '../widgets/checkout_tablet_view_body.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return RequiredLoginScreen(
      appBarTitle: context.tr(LocaleKeys.checkout_title),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => PaymentCubit(getIt())),
          BlocProvider(
            create:
                (context) =>
                    CheckoutCubit(getIt<OrdersRepo>())..initialize(context),
          ),
        ],
        child: BlocListener<CheckoutCubit, CheckoutState>(
          listener: (context, state) {
            if (state.errorMessage != null) {
              AppSnackbar.showErrorSnackBar(context, state.errorMessage!);
            }
          },
          child: Scaffold(
            bottomNavigationBar:
                ResponsiveLayout.isMobile(context)
                    ? const CheckoutPlaceOrderButton()
                    : null,
            appBar: AppBar(
              title: Text(
                context.tr(LocaleKeys.checkout_title),
                style: theme.textTheme.headlineMedium,
              ),
              backgroundColor: theme.colorScheme.surface,
            ),
            body: const ResponsiveLayout(
              mobileChild: CheckoutMobileViewBody(),
              tabletChild: CheckoutTabletViewBody(),
            ),
          ),
        ),
      ),
    );
  }
}
