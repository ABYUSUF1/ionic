import 'package:flutter/material.dart';

import '../../../../../core/widgets/text_field/form_text_field.dart';

class AddressPersonalInformation extends StatelessWidget {
  const AddressPersonalInformation({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        spacing: 16,
        children: [
          Row(
            spacing: 16,
            children: [
              Expanded(
                child: FormTextField(
                  title: "First name",
                  controller: TextEditingController(),
                ),
              ),
              Expanded(
                child: FormTextField(
                  title: "Last name",
                  controller: TextEditingController(),
                ),
              ),
            ],
          ),
          FormTextField(
            title: "Phone number",
            controller: TextEditingController(),
          ),
        ],
      ),
    );
  }
}
