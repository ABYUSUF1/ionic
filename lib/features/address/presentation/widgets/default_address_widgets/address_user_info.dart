import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ionic/features/address/domain/entity/address_entity.dart';
import 'package:ionic/generated/locale_keys.g.dart';

class AddressUserInfo extends StatelessWidget {
  final AddressEntity addressEntity;
  const AddressUserInfo({super.key, required this.addressEntity});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customInfo(
            theme,
            context.tr(LocaleKeys.address_name),
            addressEntity.fullName,
          ),
          customInfo(
            theme,
            context.tr(LocaleKeys.address_address),
            addressEntity.address,
          ),
          customInfo(
            theme,
            context.tr(LocaleKeys.address_phone),
            addressEntity.phoneNumber,
          ),
        ],
      ),
    );
  }

  Row customInfo(ThemeData theme, String title, String content) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text("$title:", style: theme.textTheme.bodySmall),
        ),
        Expanded(
          flex: 5,
          child: Text(content, style: theme.textTheme.bodyMedium),
        ),
      ],
    );
  }
}
