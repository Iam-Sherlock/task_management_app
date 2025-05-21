import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_management_app/constants/style.dart';
import 'package:task_management_app/widgets/primary_button.dart';
import 'package:task_management_app/widgets/text_field.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Welcome to \nNulinz\n Task Manager',
              style: Style.headingTextStyle,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'If you a new user please Click the Below button, or else move with the Employee Log in Or Team Leader Log in',
                style: Style.subHeadingStyle,
                textAlign: TextAlign.justify,
              ),
            ),
            PrimaryButton(
                width: 250,
                text: "New User",
                onPressed: () {
                  context.push('/signup');
                })
          ],
        ),
      ),
      bottomNavigationBar: Container(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PrimaryButton(
                  width: 170,
                  text: "Employee Log In",
                  onPressed: () {
                    context.push('/login');
                  }),
              PrimaryButton(
                  width: 170,
                  text: "TL Log In",
                  onPressed: () {
                    context.push('/tl_login');
                  })
            ],
          ),
        ),
      ),
    );
  }
}
