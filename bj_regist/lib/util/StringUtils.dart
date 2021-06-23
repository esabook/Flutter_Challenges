 extension StringUtils on String {
  /// Check if a String is a valid email.
  /// Return true if it is valid.
  bool isValidEmail() {
    return true;
    // Null or empty string is invalid
    if (this.isEmpty) {
      return false;
    }
    const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    final regExp = RegExp(pattern);

    if (!regExp.hasMatch(this)) {
      return false;
    }
    return true;
  }
}
