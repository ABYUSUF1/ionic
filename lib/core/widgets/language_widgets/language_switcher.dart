import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LanguageSwitcher extends StatelessWidget {
  const LanguageSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final currentLocale = context.locale;
    final isArabic = currentLocale.languageCode == 'ar';

    return MenuAnchor(
      builder: (context, controller, child) {
        return FilledButton.tonal(
          style: FilledButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: () => controller.open(),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.translate, size: 20, color: theme.colorScheme.primary),
              const SizedBox(width: 8),
              Text(
                isArabic ? 'العربية' : 'English',
                style: theme.textTheme.labelLarge?.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
              const SizedBox(width: 4),
              Icon(
                Icons.arrow_drop_down,
                size: 20,
                color: theme.colorScheme.primary,
              ),
            ],
          ),
        );
      },
      menuChildren: [
        FadeInDown(
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
          child: Column(
            children: [
              MenuItemButton(
                onPressed: () => context.setLocale(const Locale('en')),
                child: _LanguageTile(
                  flag: '🇺🇸',
                  language: 'English',
                  isSelected: !isArabic,
                ),
              ),
              MenuItemButton(
                onPressed: () => context.setLocale(const Locale('ar')),
                child: _LanguageTile(
                  flag: '🇸🇦',
                  language: 'العربية',
                  isSelected: isArabic,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _LanguageTile extends StatelessWidget {
  final String flag;
  final String language;
  final bool isSelected;

  const _LanguageTile({
    required this.flag,
    required this.language,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(flag, style: const TextStyle(fontSize: 20)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(language, style: Theme.of(context).textTheme.bodyLarge),
          ),
        ],
      ),
    );
  }
}
