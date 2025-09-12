import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:token_management_user/controller/auth_contoller.dart';
import 'package:token_management_user/core/constants/colors.dart';
import 'widgets/otp_header.dart';
import 'widgets/otp_image.dart';
import 'widgets/otp_input_field.dart';
import 'widgets/otp_resend_section.dart';
import 'widgets/otp_verify_button.dart';

class OtpVerificationPage extends StatelessWidget {
  final String verificationId;
  final String phoneNumber;

  const OtpVerificationPage({
    super.key,
    required this.verificationId,
   required this.phoneNumber ,
  });

  @override
  Widget build(BuildContext context) {
    final authController = context.watch<AuthController>();

    /// OTP input controllers & focus nodes
    final otpControllers = List.generate(6, (index) => TextEditingController());
    final focusNodes = List.generate(6, (index) => FocusNode());

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: OtpHeader(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
        child: Column(
          children: [
            const SizedBox(height: 40),

            /// Illustration
            const OtpImageSection(),

            const SizedBox(height: 50),

            /// Title + phone number + wrong number
            Text(
              'Enter The Verification Code sent to',
              style:  TextStyle(
                fontSize: 16,
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              phoneNumber,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () {
                context.pop(); // Go back to change number
              },
              child:  Text(
                'Wrong Number?',
                style: TextStyle(
                  color:AppColors.primary ,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),

            const SizedBox(height: 40),

            /// OTP Input Fields
            OtpInputField(
              otpControllers: otpControllers,
              focusNodes: focusNodes,
            ),

            const SizedBox(height: 30),

            /// Resend section
            const OtpResendSection(),

            const SizedBox(height: 40),

            /// Verify Button
            OtpVerifyButton(
              authController: authController,
              otpControllers: otpControllers,
              verificationId: verificationId,
            ),
          ],
        ),
      ),
    );
  }
}
