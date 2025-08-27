import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:token_management_user/controller/auth_contoller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  void navigateUser(BuildContext context) async {
    final authProvider = Provider.of<AuthController>(context, listen: false);
    bool isLoggedIn = await authProvider.checkUserLogin();

    Future.delayed(const Duration(seconds: 2), () {
      if (isLoggedIn) {
        context.push("/home");
      } else {
        context.push("/login");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Future.microtask(() => navigateUser(context));

    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
