extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

extension PasswordValidator on String {
  bool isValidPassword() {
    return RegExp(r'^[a-zA-Z0-9]{6,10}$').hasMatch(this);
  }
}

extension NameValidator on String {
  bool isValidName() {
    return RegExp(r'^[a-zA-Z]{2,}(?: [a-zA-Z]+){1,}$').hasMatch(this);
  }
}
