import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:token_management_user/views/Home/home_page.dart';
import 'package:token_management_user/views/RegisterUser/register_user.dart';
import 'package:token_management_user/views/SplashScreen/splash_screen.dart';
import 'package:token_management_user/views/auth/login_page.dart';
import 'package:token_management_user/views/auth/signup_page.dart';

// You can navigate like this anywhere in your app:

// Navigator.push()==> context.push("/profile");
// Navigator.pushReplacement()==> context.pushReplacement("/route");

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: "/splash",
    routes: [
      GoRoute(
        path: "/login",
        builder: (BuildContext context, GoRouterState state) =>
            const LoginPage(),
      ),
      GoRoute(
        path: "/signup",
        builder: (BuildContext context, GoRouterState state) =>
            const SignUpPage(),
      ),
      GoRoute(
        path: "/home",
        builder: (BuildContext context, GoRouterState state) =>
            const HomePage(),
      ),
      GoRoute(
        path: "/splash",
        builder: (BuildContext context, GoRouterState state) =>
            const SplashScreen(),
      ),
      GoRoute(
        path: "/user_registration",
        builder: (BuildContext context, GoRouterState state) =>
            const RegistrationPage(),
      ),
    ],
  );
}
