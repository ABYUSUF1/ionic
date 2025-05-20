import 'package:flutter/material.dart';

import '../../../../core/widgets/buttons/custom_back_button.dart';

class ChangePhoneNumber extends StatelessWidget {
  const ChangePhoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const CustomBackButton(),
            const SizedBox(width: 16),
            Text("Change Phone Number", style: theme.textTheme.headlineMedium),
          ],
        ),
      ),
    );
  }
}
