import 'package:flutter/material.dart';
import 'package:ionic/features/address/domain/entity/address_entity.dart';

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
          customInfo(theme, "Name", addressEntity.fullName),
          customInfo(theme, "Address", addressEntity.address),
          customInfo(theme, "Phone", addressEntity.phoneNumber),
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
