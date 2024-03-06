class Validators {
  static String? validateEmptyText(String? fieldName, value) {
    if (value.isEmpty || value == null) {
      return '$fieldName cannot be empty.';
    }
    return null;
  }

  static String? validateEmail(value) {
    if (value.isEmpty || value == null) {
      return 'Email cannot be empty.';
    }
    // Use a regular expression for email validation
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Invalid email address.';
    }
    return null; // Return null for a valid email
  }

  static String? validatePassword(value) {
    if (value.isEmpty || value == null) {
      return 'Password cannot be empty';
    }

    // Password must be at least 6 characters long
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }

    // Use regular expressions to check for uppercase letter, special character, and number
    final RegExp uppercaseRegex = RegExp(r'[A-Z]');
    final RegExp specialCharRegex = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
    final RegExp numberRegex = RegExp(r'[0-9]');

    if (!uppercaseRegex.hasMatch(value)) {
      return 'Password must contain at least one uppercase letter.';
    }
    if (!specialCharRegex.hasMatch(value)) {
      return 'Password must contain at least one special character.';
    }
    if (!numberRegex.hasMatch(value)) {
      return 'Password must contain at least one number.';
    }
    return null; // Return null for a valid password
  }

  static String? validateConfirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }

    // Password must be at least 6 characters long
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }

    // Use regular expressions to check for uppercase letter, special character, and number
    final RegExp uppercaseRegex = RegExp(r'[A-Z]');
    final RegExp specialCharRegex = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
    final RegExp numberRegex = RegExp(r'[0-9]');

    if (!uppercaseRegex.hasMatch(value)) {
      return 'Password must contain at least one uppercase letter.';
    }
    if (!specialCharRegex.hasMatch(value)) {
      return 'Password must contain at least one special character.';
    }
    if (!numberRegex.hasMatch(value)) {
      return 'Password must contain at least one number.';
    }

    if (value != password) {
      return 'Passwords do not match';
    }

    return null; // Return null for a valid password
  }
}
