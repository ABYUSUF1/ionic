import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LanguageSwitcher extends StatelessWidget {
  const LanguageSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final currentLocale = context.locale;

    return PopupMenuButton<Locale>(
      tooltip: 'Change Language',
      onSelected: (Locale locale) {
        context.setLocale(locale);
      },
      icon: Row(
        children: [
          Icon(Icons.language, color: theme.iconTheme.color),
          const SizedBox(width: 4),
          Text(
            currentLocale.languageCode.toUpperCase(),
            style: theme.textTheme.bodyMedium,
          ),
        ],
      ),
      itemBuilder:
          (context) => [
            PopupMenuItem(
              value: const Locale('en'),
              child: Row(children: const [Text('🇺🇸  English')]),
            ),
            PopupMenuItem(
              value: const Locale('ar'),
              child: Row(children: const [Text('🇸🇦  العربية')]),
            ),
          ],
    );
  }
}
