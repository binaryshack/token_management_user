import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:token_management_user/services/firebase_auth_service.dart';

class UserAuthRepository {
  final FirebaseAuthService _firebaseAuthService;

  UserAuthRepository(this._firebaseAuthService);

  /// Email Login
  Future<void> loginWithEmail(String email, String password) async {
    await _firebaseAuthService.loginWithEmail(email, password);
    await _saveUserLoggedIn();
  }

  /// Email Register
  Future<User?> registerWithEmail(String email, String password) async {
    final user = await _firebaseAuthService.registerWithEmail(email, password);
    await _saveUserLoggedIn();
    return user;
  }

  /// Google Login
  Future<User?> loginWithGoogle() async {
    final user = await _firebaseAuthService.signInWithGoogle();
    if (user != null) {
      await _saveUserLoggedIn();
    }
    return user;
  }

  /// Phone Number Verification
  Future<void> verifyPhoneNumber({
    required String phoneNumber,
    required Function(PhoneAuthCredential) onVerificationCompleted,
    required Function(FirebaseAuthException) onVerificationFailed,
    required Function(String verificationId, int? resendToken) onCodeSent,
    required Function(String) onCodeAutoRetrievalTimeout,
  }) async {
    await _firebaseAuthService.verifyPhone(
      phoneNumber: phoneNumber,
      onVerificationCompleted: onVerificationCompleted,
      onVerificationFailed: onVerificationFailed,
      onCodeSent: onCodeSent,
      onCodeAutoRetrievalTimeout: onCodeAutoRetrievalTimeout,
    );
  }

  /// OTP Verification
  Future<User?> verifyOtp(String verificationId, String smsCode) async {
    final user = await _firebaseAuthService.verifyOtp(verificationId, smsCode);
    if (user != null) {
      await _saveUserLoggedIn();
    }
    return user;
  }

  /// Logout
  Future<void> logout() async {
    await _firebaseAuthService.signOut();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isLoggedIn", false);
  }

  /// Save Login State
  Future<void> _saveUserLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isLoggedIn", true);
  }

  /// Check if logged in
  Future<bool> isUserLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool("isLoggedIn") ?? false;
  }
}
