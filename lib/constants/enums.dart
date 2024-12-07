enum TextFieldType {
  email,
  password,
  confirmPassword,
  name,
  text,
  codePostal,
  otp,
  phone;

  @override
  String toString() {
    switch (this) {
      case TextFieldType.email:
        return 'Email';
      case TextFieldType.password:
        return 'Password';
      case TextFieldType.confirmPassword:
        return 'Confirm Password';
      case TextFieldType.name:
        return 'Name';
      case TextFieldType.text:
        return 'Text';
      case TextFieldType.codePostal:
        return 'Code Postal';
      case TextFieldType.otp:
        return 'Otp';
      case TextFieldType.phone:
        return 'Phone';
    }
  }
}
