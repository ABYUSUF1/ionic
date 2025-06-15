import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';

String appFont(BuildContext context) {
  return context.locale.languageCode == 'ar' ? 'Tajawal' : 'Pulp Display';
}
