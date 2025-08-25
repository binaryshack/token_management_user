import 'package:flutter/material.dart';
import 'package:token_management_user/core/constants/password_field_type.dart';

class CustometexfieldProvider with ChangeNotifier {
  final Map<PasswordFieldType, bool> _obscureMap = {
    PasswordFieldType.loginPassword: true,
    PasswordFieldType.signupPassword: true,
    PasswordFieldType.confirmPassword: true,
  };

  bool isObscure(PasswordFieldType type) => _obscureMap[type] ?? true;

  void toggleVisibility(PasswordFieldType type) {
    _obscureMap[type] = !_obscureMap[type]!;
    notifyListeners();
  }
}
