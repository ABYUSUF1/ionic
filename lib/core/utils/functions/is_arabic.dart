import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';

bool isArabic(BuildContext context) {
  // Check if the current locale's language code is 'ar' (Arabic)
  return context.locale.languageCode == 'ar';
}
