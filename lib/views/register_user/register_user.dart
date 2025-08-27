import 'package:flutter/material.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final ageController = TextEditingController();
    final phoneController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Registration"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Name Field
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Age Field
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Age",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Phone Field
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: "Phone",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),

            // Register Button
            ElevatedButton(
              onPressed: () {
                // Only UI for now (no logic)
              },
              child: const Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}
