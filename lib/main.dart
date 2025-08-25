import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:token_management_user/controller/auth_contoller.dart';
import 'package:token_management_user/core/routes/routes.dart';
import 'package:token_management_user/repository/auth_repository.dart';
import 'core/firebase/firebase_options.dart';
import 'services/firebase_auth_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) =>
              AuthController(UserAuthRepository(FirebaseAuthService())),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Token Management Application',
        theme: ThemeData(primarySwatch: Colors.blue),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
