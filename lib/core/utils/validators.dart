class Validators {
  static String? validateEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field is required';
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    if (value.length < 3) {
      return 'Name must be at least 3 characters';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    const emailRegex = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    if (!RegExp(emailRegex).hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return 'Confirm Password is required';
    }
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }

  // URL Validation Function
  static String? validateUrl(String? value) {
    if (value == null || value.isEmpty) return null; // Allow empty field
    final Uri? uri = Uri.tryParse(value);
    if (uri == null ||
        !uri.hasScheme ||
        !(uri.scheme == 'http' || uri.scheme == 'https')) {
      return 'Enter a valid URL (http or https)';
    }
    return null;
  }

  static String? validateYoutubeLink(String? value) {
    if (value == null || value.isEmpty) return null; // not required
    const pattern = r'^(https?\:\/\/)?(www\.youtube\.com|youtu\.be)\/.+$';
    final regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Enter a valid YouTube link';
    }
    return null;
  }
}
