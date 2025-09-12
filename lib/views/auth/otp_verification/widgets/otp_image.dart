import 'package:flutter/material.dart';
import 'package:token_management_user/core/constants/colors.dart';

class OtpImageSection extends StatelessWidget {
  const OtpImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withAlpha((0.05 * 255).toInt()),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Image.asset('assets/images/otp_image.png'),
    );
  }
}
