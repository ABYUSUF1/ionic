import 'package:flutter/material.dart';
import 'package:ionic/features/auth/presentation/widgets/email_sent_view_body.dart';

import '../../../../core/widgets/buttons/custom_back_button.dart';

class EmailSentView extends StatelessWidget {
  final String title;
  const EmailSentView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        title: const CustomBackButton(),
        automaticallyImplyLeading: false,
      ),
      body: EmailSentViewBody(title: title),
    );
  }
}
