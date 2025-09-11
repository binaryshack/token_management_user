import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:token_management_user/controller/auth_contoller.dart';
import 'package:token_management_user/core/constants/colors.dart';
import 'package:token_management_user/core/helpers/validators.dart';
import 'package:token_management_user/core/widgets/my_coustom_button.dart';
import 'package:token_management_user/core/widgets/my_custom_snack_bar.dart';
import 'package:token_management_user/core/widgets/my_text_field.dart';
import 'package:token_management_user/views/auth/widgets/auth_google_button.dart';

class AuthLoginSection extends StatelessWidget {
  const AuthLoginSection({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneNumberController = TextEditingController();
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Login Or Sign Up', style: TextStyle(fontSize: 16)),
              ),
              Expanded(
                child: Divider(color: AppColors.grey600, thickness: 0.7),
              ),
            ],
          ),
          SizedBox(height: 10),

          MyCustomTextFormField(
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
                children: [
                  const Icon(Icons.phone, color: Colors.green, size: 20),
                  const SizedBox(width: 5),
                  const Text(
                    '+91',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(width: 6),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          MyCustomButton(onPressed: () {}, text: 'continue'),
          SizedBox(height: 20),
          Text('Or', style: TextStyle(fontSize: 18)),
          SizedBox(height: 20),

          //-----------google button-----------
          AuthGoogleButton(
            onTap: () async {
              bool success = await context
                  .read<AuthController>()
                  .regUsingGoogleAcc();
              if (success) {
                // Example navigation (uncomment when home page is ready)
                   MyCustomSnackBar.show(
                  context: context,
                  title: "Success 🎉",
                  message: "Sign up with google was completed successfully.",
                  icon: Icons.check_circle_rounded,
                  iconColor: AppColors.textWhite,
                  accentColor: AppColors.success,
                  backgroundColor: AppColors.success,
                  textColor: AppColors.textWhite,
                );
                context.push('/home');
              }
            },
          ),
        ],
      ),
    );
  }
}