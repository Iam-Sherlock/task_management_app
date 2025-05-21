import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:task_management_app/auth/providers/auth_provider.dart';
import 'package:task_management_app/constants/colors.dart';
import 'package:task_management_app/constants/style.dart';
import 'package:task_management_app/widgets/appbar_widget.dart';
import 'package:task_management_app/widgets/primary_button.dart';
import 'package:task_management_app/widgets/text_field.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    ));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: true);
    return Scaffold(
      appBar: AppbarWidget(
        title: "Employee Sign In",
        isInformation: false,
        backArraw: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            FadeTransition(
              opacity: _fadeAnimation,
              child: Center(
                child: Image.asset(
                  'assets/images/login_img.png',
                  height: 180,
                ),
              ),
            ),
            const SizedBox(height: 10),
            SlideTransition(
              position: _slideAnimation,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryBgColor,
                  boxShadow: AppColors.cardBoxShadow,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                width: double.infinity,
                height: 600,
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                child: Form(
                  child: Column(
                    children: [
                      Text("Log In", style: Style.subHeadingStyle),
                      const SizedBox(height: 20),
                      PrimaryTextField(
                        hintText: "Enter your Email",
                        controller: emailController,
                        isRequried: true,
                      ),
                      const SizedBox(height: 20),
                      PrimaryTextField(
                        hintText: "Enter Your Password",
                        controller: passwordController,
                        isRequried: true,
                        obscureText: true,
                      ),
                      const SizedBox(height: 20),
                      PrimaryButton(
                        text: 'Log In',
                        width: 300,
                        onPressed: () {
                          authProvider.loginUserwithEmailAndPassword(
                            context,
                            emailController.text.trim(),
                            passwordController.text.trim(),
                            false,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
