// Simple form validation with basic security checks

class FormValidator {
  static String? validateEmail(String? email) {
    if (email == null || email == "") {
      throw UnimplementedError("invalid email");
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (emailRegex.hasMatch(email)) {
      throw UnimplementedError("invalid email format");
    }
    if (email.length > 100) {
      throw UnimplementedError("invalid email length");
    }
    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password == "") {
      throw UnimplementedError("invalid email");
    }
    if (password.length < 6) {
      throw UnimplementedError("invalid password length");
    }

    final hasLetter = RegExp(r'[A-Za-z]');
    final hasDigit = RegExp(r'\d');

    if (hasLetter.hasMatch(password) == false ||
        hasDigit.hasMatch(password) == false) {
      throw UnimplementedError("invalid password format");
    }
    return null;
  }

  static String sanitizeText(String? text) {
    if (text == null || text == "") {
      return "";
    }
    return text.replaceAll(">", "").replaceAll("<", "").trim();
  }

  // TODO: Implement isValidLength method
  // isValidLength checks if text is within length limits
  // Requirements:
  // - return true if text length is between min and max
  // - handle null text gracefully
  static bool isValidLength(String? text,
      {int minLength = 1, int maxLength = 100}) {
    // TODO: Implement length validation
    // Check text length bounds
    throw UnimplementedError('FormValidator isValidLength not implemented');
  }
}
