import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionic/core/constants/app_assets.dart';
import 'package:ionic/generated/locale_keys.g.dart';
import 'package:ionic/core/widgets/empty_state_widget.dart';

import 'network_cubit.dart';
import 'network_online_snackbar.dart';

class NetworkView extends StatelessWidget {
  const NetworkView({super.key, required this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return BlocConsumer<NetworkCubit, NetworkStatus>(
      listener: (context, state) {
        if (state == NetworkStatus.connected &&
            context.read<NetworkCubit>().wasDisconnected) {
          context.read<NetworkCubit>().markReconnectionHandled();
          showOnlineSnackBar(context);
        }
      },
      builder: (context, state) {
        if (state == NetworkStatus.disconnected) {
          return Scaffold(
            appBar: AppBar(),
            backgroundColor: theme.colorScheme.surface,
            body: EmptyStateWidget(
              svgImage:
                  isDark
                      ? AppAssets.illustrationsNoConnectionIllustrationDark
                      : AppAssets.illustrationsNoConnectionIllustrationLight,
              title: context.tr(LocaleKeys.network_no_internet),
              subtitle: context.tr(LocaleKeys.network_no_internet_desc),
            ),
          );
        }
        return child!;
      },
    );
  }
}
