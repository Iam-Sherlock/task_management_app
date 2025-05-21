import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_management_app/auth/login.dart';
import 'package:task_management_app/auth/providers/auth_service.dart';
import 'package:task_management_app/constants/colors.dart';
import 'package:task_management_app/router/app_router.dart';
import 'package:task_management_app/welcome_screen/screens/welcome_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryBlue),
            useMaterial3: true,
            textTheme: GoogleFonts.robotoTextTheme(),
            scaffoldBackgroundColor: AppColors.primaryBgColor),
        routerConfig: appRouter);
  }
}
