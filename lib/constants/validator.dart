
import 'package:flutter_belsons/constants/enums.dart';

String? validatorTextField(
    {required TextFieldType typeTextField,
    required String? value,
    String? password}) {
  switch (typeTextField) {
    case TextFieldType.email:
      final regex = RegExp(
          r'^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
      if (value!.isEmpty) return 'Email cannot be empty';
      if (!regex.hasMatch(value)) return 'Enter a valid email address';

    case TextFieldType.password:
      if (value!.isEmpty) return 'Password cannot be empty';
      if (!RegExp('^(?=.*[a-z])').hasMatch(value))
        return 'Password must contain at least one lowercase letter';
      if (!RegExp('^(?=.*[A-Z])').hasMatch(value))
        return 'Password must contain at least one capital letter';
      if (!RegExp(r'^(?=.*\d)').hasMatch(value))
        return 'Password must contain at least one number';
      if (!RegExp(r'^.{8,}$').hasMatch(value))
        return 'Password must be at least 8 characters long';

      return null;

    case TextFieldType.confirmPassword:
      if (value!.isEmpty) return 'Password cannot be empty';

      if (password != value) return 'Passwords do not match';

      return null;

    case TextFieldType.name:
      final regex = RegExp('^[A-Za-z]');
      if (value!.isEmpty) return 'Name cannot be empty';

      if (value.length <= 2) return 'Name must be more than 2 characters long';

      if (!regex.hasMatch(value)) return 'Enter a valid name';
      return null;

    case TextFieldType.text:
      if (value!.length <= 2) return 'Address must be more than 2 characters';
      return null;

    case TextFieldType.codePostal:
      final regex = RegExp(r'^\d{5}$');
      if (value!.isEmpty) return 'Zip code cannot be empty';
      if (!regex.hasMatch(value)) return 'Enter a valid zip code';

      return null;

    case TextFieldType.otp:
      final regex = RegExp(r'^\d{6}$');
      if (value!.isEmpty) return 'OTP  cannot be empty';
      if (!regex.hasMatch(value)) return 'Please enter a valid OTP code';
      return null;
    case TextFieldType.phone:
      final phoneRegex = RegExp(r'^((\+971|971)?5[0-9]{8})$');
      if (value!.isEmpty) return 'Phone number cannot be empty';
      if (!phoneRegex.hasMatch(value))
        return 'Enter a valid UAE phone number (e.g., +97150XXXXXXX)';
      return null;
  }

  return null;
}
