import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ionic/core/widgets/buttons/custom_filled_button.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/theme/app_colors.dart';

class EmailSentViewBody extends StatelessWidget {
  final String title;
  const EmailSentViewBody({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  Brightness.light == theme.brightness
                      ? AppAssets.illustrationsSendingIllustrationLight
                      : AppAssets.illustrationsSendingIllustrationDark,
                  width: 250,
                  height: 250,
                ),
                Text(title, style: theme.textTheme.headlineMedium),
                const SizedBox(height: 5),
                Text.rich(
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  TextSpan(
                    children: [
                      TextSpan(text: "We have sent a link to "),
                      TextSpan(
                        text: "ym2250420@gmail.com.",
                        style: TextStyle(color: AppColors.primaryColor),
                      ),
                      TextSpan(text: "\nPlease check your email for the link."),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                CustomFilledButton(text: "Back to Login", onPressed: () {}),
                const SizedBox(height: 50),
                Text(
                  "Didn't receive the email?",
                  style: theme.textTheme.bodyMedium,
                ),
                Text(
                  "Resend",
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
