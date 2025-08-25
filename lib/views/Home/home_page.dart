import 'package:flutter/material.dart';
import 'package:token_management_user/core/widgets/my_text_field.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();

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
      body: Column(
        children: [
          MyCustomTextFormField(
            controller: name,
            hintText: 'hintText',
            validator: (value) =>
                value!.isEmpty ? "Confirm password required" : null,
          ),
          Text('data'),
        ],
      ),
    );
  }
}
