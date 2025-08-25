import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:token_management_user/controller/auth_contoller.dart';

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
              context.go("/login"); // ✅ go back to login
            },
          ),
        ],
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // ✅ center row
          children: [
            ElevatedButton(onPressed: () {}, child: const Text("Button 1")),
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
