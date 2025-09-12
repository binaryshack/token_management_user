// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:token_management_user/controller/auth_contoller.dart';
import 'package:token_management_user/core/constants/colors.dart';
import 'package:token_management_user/core/widgets/my_coustom_button.dart';
import 'package:token_management_user/core/widgets/my_custom_snack_bar.dart';

class OtpVerifyButton extends StatelessWidget {
  final AuthController authController;
  final List<TextEditingController> otpControllers;
  final String verificationId;

  const OtpVerifyButton({
    super.key,
    required this.authController,
    required this.otpControllers,
    required this.verificationId,
  });

  @override
  Widget build(BuildContext context) {
    return MyCustomButton(
      onPressed: () async {
        String otp = otpControllers.map((controller) => controller.text).join();

        if (otp.length != 6) {
          MyCustomSnackBar.show(
            context: context,
            title: "Error ⚠️",
            message: "Please enter complete 6-digit OTP",
            icon: Icons.error,
            backgroundColor: Colors.red,
            textColor: AppColors.textWhite,
            iconColor: AppColors.textWhite,
          );
          return;
        }

        bool success = await authController.verifyOtp(verificationId, otp);

        if (success) {
          MyCustomSnackBar.show(
            context: context,
            title: "Success 🎉",
            message: "Phone verified successfully!",
            icon: Icons.check_circle_rounded,
            backgroundColor: AppColors.success,
            textColor: AppColors.textWhite,
            iconColor: AppColors.textWhite,
          );
          context.go("/home");
        } else {
          MyCustomSnackBar.show(
            context: context,
            title: "Error ⚠️",
            message: authController.errorMessage ?? "Verification failed",
            icon: Icons.error,
            backgroundColor: Colors.red,
            textColor: AppColors.textWhite,
            iconColor: AppColors.textWhite,
          );
        }
      },
      text: 'verify Otp',
      isLoading: authController.isLoading,
    );
  }
}
