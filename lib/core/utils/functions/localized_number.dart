import 'package:flutter/material.dart';

String localizedNumber(BuildContext context, String input) {
  // Check if locale languageCode is Arabic
  if (Localizations.localeOf(context).languageCode == 'ar') {
    const englishNums = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const arabicNums = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];

    for (int i = 0; i < englishNums.length; i++) {
      input = input.replaceAll(englishNums[i], arabicNums[i]);
    }
  }
  return input;
}
