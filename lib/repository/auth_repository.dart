import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:token_management_user/services/firebase_auth_services.dart';

class UserAuthRepository {
  final FirebaseAuthService _firebaseAuthService;

  UserAuthRepository(this._firebaseAuthService);

  Future<void> login(String email, String password) async {
    await _firebaseAuthService.signIn(email, password);
    await saveUserLoggedIn();
  }

  Future<UserCredential> register(String email, String password) async {
    return await _firebaseAuthService.signUp(email, password);
  }

  Future<void> logout() async {
    await _firebaseAuthService.signOut();
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  Future<void> saveUserLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isLoggedIn", true);
  }

  Future<bool> isUserLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool("isLoggedIn") ?? false;
  }
}
