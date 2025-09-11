import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:token_management_user/controller/auth_contoller.dart';
import 'package:token_management_user/controller/auth_page_carousel_provider.dart';
import 'package:token_management_user/controller/custom_text_field_provider.dart';
import 'package:token_management_user/core/constants/colors.dart';
import 'package:token_management_user/core/routes/routes.dart';
import 'package:token_management_user/repository/auth_repository.dart';
import 'package:token_management_user/services/firebase_auth_service.dart';
import 'core/firebase/firebase_options.dart';

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
        ChangeNotifierProvider(create: (_) => CustometexfieldProvider()),
        ChangeNotifierProvider(create: (_) => CarouselProvider()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Token Management Application',
        theme: ThemeData(
          fontFamily: 'Montserrat',
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: AppColors.background,
        ),
        routerConfig: AppRouter.router,
      ),

    );
  }
}



