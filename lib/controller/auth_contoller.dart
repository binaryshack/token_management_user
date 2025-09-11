import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../repository/auth_repository.dart';

class AuthController extends ChangeNotifier {
  final UserAuthRepository _authRepository;
  User? user;
  String? errorMessage;
  bool isLoading = false;

  AuthController(this._authRepository);

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  // /// Login with email
  // Future<void> loginAccount(String email, String password) async {
  //   setLoading(true);
  //   try {
  //     await _authRepository.loginWithEmail(email, password);
  //     user = FirebaseAuth.instance.currentUser;
  //     notifyListeners();
  //   } on FirebaseAuthException catch (e) {
  //     errorMessage = e.message;
  //     throw Exception(e.message);
  //   } finally {
  //     setLoading(false);
  //   }
  // }

  // /// Register with email
  // Future<User?> signUpAccount(String email, String password) async {
  //   setLoading(true);
  //   try {
  //     user = await _authRepository.registerWithEmail(email, password);
  //     notifyListeners();
  //     return user;
  //   } on FirebaseAuthException catch (e) {
  //     errorMessage = e.message;
  //     throw Exception(e.message);
  //   } finally {
  //     setLoading(false);
  //   }
  // }

  /// Logout
  Future<void> logout() async {
    setLoading(true);
    try {
      await _authRepository.logout();
      user = null;
      notifyListeners();
    } catch (e) {
      throw Exception(e.toString());
    } finally {
      setLoading(false);
    }
  }

  /// Check if user already logged in
  Future<bool> checkUserLogin() async {
    return await _authRepository.isUserLoggedIn();
  }

  /// Google Sign-in
  Future<bool> regUsingGoogleAcc() async {
    setLoading(true);
    try {
      user = await _authRepository.loginWithGoogle();
      notifyListeners();
      return user != null;
    } catch (e) {
      errorMessage = e.toString();
      return false;
    } finally {
      setLoading(false);
    }
  }
}
