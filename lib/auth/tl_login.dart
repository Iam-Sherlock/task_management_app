import 'package:flutter/material.dart';
import 'package:task_management_app/auth/providers/auth_provider.dart';
import 'package:task_management_app/constants/colors.dart';
import 'package:task_management_app/constants/style.dart';
import 'package:task_management_app/constants/utils.dart';
import 'package:task_management_app/widgets/appbar_widget.dart';
import 'package:task_management_app/widgets/primary_button.dart';
import 'package:task_management_app/widgets/text_field.dart';

class TlLogin extends StatelessWidget {
  const TlLogin({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppbarWidget(
        title: "Team Lead Log In",
        isInformation: false,
        backArraw: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppColors.primaryBgColor,
                boxShadow: AppColors.cardBoxShadow,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            width: 400,
            height: 400,
            child: Form(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                child: Column(
                  children: [
                    Text(
                      "Log In",
                      style: Style.subHeadingStyle,
                    ),
                    gapH20,
                    PrimaryTextField(
                        hintText: "Enter your Email",
                        controller: emailController,
                        isRequried: true),
                    gapH20,
                    PrimaryTextField(
                      hintText: "Enter Your Password",
                      controller: passwordController,
                      isRequried: true,
                      obscureText: true,
                    ),
                    gapH20,
                    PrimaryButton(
                      text: 'Log In',
                      width: 300,
                      onPressed: () {
                        loginUserwithEmailAndPassword(
                            context,
                            emailController.text.trim(),
                            passwordController.text.trim(),
                            true);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
