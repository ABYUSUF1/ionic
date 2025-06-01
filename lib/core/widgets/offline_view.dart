import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ionic/core/constants/app_assets.dart';
import 'package:ionic/core/widgets/empty_widget.dart';

import '../../generated/locale_keys.g.dart';

class OfflineScreen extends StatelessWidget {
  const OfflineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: EmptyWidget(
            svgImage:
                isDarkMode
                    ? AppAssets.illustrationsNoConnectionIllustrationDark
                    : AppAssets.illustrationsNoConnectionIllustrationLight,
            title: context.tr(LocaleKeys.network_no_internet),
            subtitle: context.tr(LocaleKeys.network_no_internet_desc),
          ),
        ),
      ),
    );
  }
}
