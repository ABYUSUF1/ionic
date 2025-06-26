import 'package:easy_localization/easy_localization.dart';
import 'package:ionic/generated/locale_keys.g.dart';

class Validators {
  static String? validateEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.validators_required.tr();
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.validators_name_required.tr();
    }
    if (value.length < 3) {
      return LocaleKeys.validators_name_short.tr();
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.validators_email_required.tr();
    }
    const emailRegex = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    if (!RegExp(emailRegex).hasMatch(value)) {
      return LocaleKeys.validators_email_invalid.tr();
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.validators_password_required.tr();
    }
    if (value.length < 8) {
      return LocaleKeys.validators_password_short.tr();
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.validators_confirm_password_required.tr();
    }
    if (value != password) {
      return LocaleKeys.validators_passwords_mismatch.tr();
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.validators_phone_required.tr();
    }

    if (value.length < 10) {
      return LocaleKeys.validators_phone_short.tr();
    }

    if (value.length > 15) {
      return LocaleKeys.validators_phone_long.tr();
    }

    if (!RegExp(r'^\+?[0-9]+$').hasMatch(value)) {
      return LocaleKeys.validators_phone_invalid.tr();
    }
    return null;
  }

  static String? validateUrl(String? value) {
    if (value == null || value.isEmpty) return null; // Allow empty field
    final Uri? uri = Uri.tryParse(value);
    if (uri == null ||
        !uri.hasScheme ||
        !(uri.scheme == 'http' || uri.scheme == 'https')) {
      return LocaleKeys.validators_url_invalid.tr();
    }
    return null;
  }

  static String? validateYoutubeLink(String? value) {
    if (value == null || value.isEmpty) return null; // not required
    const pattern = r'^(https?\:\/\/)?(www\.youtube\.com|youtu\.be)\/.+$';
    final regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return LocaleKeys.validators_youtube_invalid.tr();
    }
    return null;
  }
}
