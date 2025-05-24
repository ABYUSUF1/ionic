import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:ionic/generated/locale_keys.g.dart';

class CustomLanguageButton extends StatelessWidget {
  const CustomLanguageButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isArabic = context.locale.languageCode == 'ar';
    return ListTile(
      leading: const Icon(IconsaxPlusLinear.translate, size: 28),
      title: Text(
        LocaleKeys.profile_language.tr(),
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      trailing: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: theme.colorScheme.secondary,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Text(
          isArabic ? "To English" : "إلى العربية",
          style: theme.textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      onTap: () {
        context.setLocale(Locale(isArabic ? 'en' : 'ar'));
      },
    );
  }
}
