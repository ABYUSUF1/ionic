import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ionic/core/widgets/required_login_widget.dart';
import 'package:ionic/features/address/presentation/widgets/default_address_widgets/default_address_bottom_bar.dart';
import 'package:ionic/generated/locale_keys.g.dart';
import '../widgets/default_address_widgets/default_address_view_body.dart';

class DefaultAddressView extends StatelessWidget {
  const DefaultAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return RequiredLoginScreen(
      appBarTitle: context.tr(LocaleKeys.address_default_address),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: theme.colorScheme.surface,
          title: Text(
            context.tr(LocaleKeys.address_default_address),
            style: theme.textTheme.headlineMedium,
          ),
        ),
        bottomNavigationBar: const DefaultAddressBottomBar(),
        body: const DefaultAddressViewBody(),
      ),
    );
  }
}
