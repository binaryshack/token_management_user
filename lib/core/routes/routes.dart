import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:token_management_user/views/auth/login_page/auth_page_main.dart';
import 'package:token_management_user/views/auth/otp_verification/otp_verification_page.dart';
import 'package:token_management_user/views/register_user/register_user.dart';
import 'package:token_management_user/views/splash_screen/splash_screen.dart';

import 'package:token_management_user/views/home_page/home_page.dart';

// You can navigate like this anywhere in your app:

// Navigator.push()==> context.push("/profile");
// Navigator.pushReplacement()==> context.pushReplacement("/route");

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: "/splash",
    routes: [
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
      GoRoute(
        path: "/user_auth_page",
        builder: (BuildContext context, GoRouterState state) =>
            const AuthPageMain(),
      ),

      GoRoute(
        path: "/otp",
        builder: (BuildContext context, GoRouterState state) {
          final extra = state.extra as Map<String, dynamic>?;
          final verificationId = extra?['verificationId'] as String?;
          final phoneNumber = extra?['phoneNumber'] as String?;
          return OtpVerificationPage(
            verificationId: verificationId ?? "",
            phoneNumber: phoneNumber ?? '',
          );
        },
      ),
    ],
  );
}
