class EmailValidator {
  static const Set<String> allowedCollegeDomains = {
    "sigce.edu.in",
    // "iitb.ac.in",
    // "iitd.ac.in",
  };

  static bool isValidCollegeEmail(String email) {
    if (!email.contains('@')) return false; // null safety if user ytpes 'hello'
    final domain = email.split('@').last.toLowerCase();
    return allowedCollegeDomains.contains(domain);
  }
}
