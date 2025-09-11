import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:token_management_user/controller/auth_contoller.dart';
import 'package:token_management_user/core/constants/colors.dart';
import 'package:token_management_user/views/auth/auth_login_section.dart';
import 'package:token_management_user/views/auth/widgets/auth_carousel.dart';

class AuthPageMain extends StatelessWidget {
  const AuthPageMain({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = context.watch<AuthController>();

    return Scaffold(
      body: Stack(
        children: [
          // Main content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: const [AuthCarousel(), AuthLoginSection()],
                ),
              ),
            ),
          ),

          // Loader overlay
          if (authController.isLoading)
            Container(
              color: AppColors.black.withAlpha((0.3 * 255).toInt()),
              child: const Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }
}
