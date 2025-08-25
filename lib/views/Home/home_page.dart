import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:token_management_user/controller/auth_contoller.dart';
import 'package:token_management_user/core/widgets/my_text_field.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();

    return Scaffold(
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
