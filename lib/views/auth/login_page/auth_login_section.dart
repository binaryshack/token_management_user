// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:token_management_user/controller/auth_contoller.dart';
import 'package:token_management_user/core/constants/colors.dart';
import 'package:token_management_user/core/helpers/validators.dart';
import 'package:token_management_user/core/widgets/my_coustom_button.dart';
import 'package:token_management_user/core/widgets/my_custom_snack_bar.dart';
import 'package:token_management_user/core/widgets/my_text_field.dart';
import 'package:token_management_user/views/auth/login_page/widgets/auth_google_button.dart';

class AuthLoginSection extends StatelessWidget {
  AuthLoginSection({super.key});

  final TextEditingController phoneNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authController = context.watch<AuthController>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          //------------- Login Or Sign Up heading-----------------
          Row(
            children: [
              Expanded(
                child: Divider(color: AppColors.grey600, thickness: 0.7),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Login Or Sign Up', style: TextStyle(fontSize: 16)),
              ),
              Expanded(
                child: Divider(color: AppColors.grey600, thickness: 0.7),
              ),
            ],
          ),
          const SizedBox(height: 10),

          /// Phone input field
          Form(
            key: _formKey,
            child: MyCustomTextFormField(
              controller: phoneNumberController,
              hintText: 'Enter Phone Number',
              validator: AppValidator.validatePhone,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.phone,
              enabledBorderColor: AppColors.buttonPrimaryBg,
              prefix: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.phone, color: Colors.green, size: 20),
                    SizedBox(width: 5),
                    Text(
                      '+91',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(width: 6),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),

          /// Phone Number Continue Button
          MyCustomButton(
            isLoading: authController.isLoading,
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                await authController.sendOtp(
                  "+91 ${phoneNumberController.text.trim()}",
                  onCodeSent: (id, _) {
                    /// Navigate to OTP screen
                    context.push(
                      "/otp",
                      extra: {
                        "verificationId": id,
                        "phoneNumber": phoneNumberController.text.trim(),
                      },
                    );
                  },
                );

                if (authController.errorMessage != null) {
                  MyCustomSnackBar.show(
                    context: context,
                    title: "Error ⚠️",
                    message: authController.errorMessage!,
                    icon: Icons.error,
                    iconColor: AppColors.textWhite,
                    accentColor: Colors.red,
                    backgroundColor: Colors.red,
                    textColor: AppColors.textWhite,
                  );
                }
              }
            },
            text: authController.isLoading ? "Sending..." : "Continue",
          ),

          const SizedBox(height: 20),
          const Text('Or', style: TextStyle(fontSize: 18)),
          const SizedBox(height: 20),

          //-----------google button-----------
          AuthGoogleButton(
            onTap: () async {
              bool success = await context
                  .read<AuthController>()
                  .regUsingGoogleAcc();
              if (success) {
                MyCustomSnackBar.show(
                  context: context,
                  title: "Success 🎉",
                  message: "Sign up with Google was completed successfully.",
                  icon: Icons.check_circle_rounded,
                  iconColor: AppColors.textWhite,
                  accentColor: AppColors.success,
                  backgroundColor: AppColors.success,
                  textColor: AppColors.textWhite,
                );
                context.push('/home');
              } else if (authController.errorMessage != null) {
                MyCustomSnackBar.show(
                  context: context,
                  title: "Error ⚠️",
                  message: authController.errorMessage!,
                  icon: Icons.error,
                  iconColor: AppColors.textWhite,
                  accentColor: Colors.red,
                  backgroundColor: Colors.red,
                  textColor: AppColors.textWhite,
                );
              }
            },
          ),
          SizedBox(height: 15),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
                height: 1.5,
              ),
              children: [
                const TextSpan(text: 'By continuing, you agree to our '),
                TextSpan(
                  text: 'terms and conditions',
                  style: TextStyle(
                    color: AppColors.accent,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.accent,
                  ),
                ),
                const TextSpan(text: ' & '),
                TextSpan(
                  text: 'Privacy Policy',
                  style: TextStyle(
                    color: AppColors.accent,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.accent,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
