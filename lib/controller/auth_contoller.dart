import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../repository/auth_repository.dart';

class AuthController extends ChangeNotifier {
  final UserAuthRepository _authRepository;

  AuthController(this._authRepository);

  Future<void> loginAccount(String email, String password) async {
    try {
      await _authRepository.login(email, password);
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<UserCredential> signUpAccount(String email, String password) async {
    try {
      return await _authRepository.register(email, password);
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> logout() async {
    try {
      await _authRepository.logout();
      notifyListeners();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<bool> checkUserLogin() async {
    return await _authRepository.isUserLoggedIn();
  }
}
