import 'package:flutter/material.dart';
import 'package:token_management_user/core/constants/colors.dart';

class OtpResendSection extends StatelessWidget {
  const OtpResendSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Text(
          "Didn't receive the code? ",
          style: TextStyle(fontSize: 14, color: AppColors.black),
        ),
        TextButton(
          onPressed: () {
            
          },
          child:  Text(
            'Resend in 58s',
            style: TextStyle(
              color: AppColors.grey,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
