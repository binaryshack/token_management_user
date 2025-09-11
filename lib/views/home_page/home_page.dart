import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:token_management_user/controller/auth_contoller.dart';
import 'package:token_management_user/core/constants/colors.dart';
import 'package:token_management_user/core/widgets/my_custom_snack_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AuthController>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await controller.logout();
              context.go("/user_auth_page");
            },
          ),
        ],
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
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
              },
              child: const Text("Button 1"),
            ),
            const SizedBox(width: 16), // space between buttons
            ElevatedButton(onPressed: () {}, child: const Text("Button 2")),
            const SizedBox(width: 16),
            ElevatedButton(onPressed: () {}, child: const Text("Button 3")),
          ],
        ),
      ),
    );
  }
}
