import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_management_app/auth/providers/auth_service.dart';
import 'package:task_management_app/widgets/snack_bar.dart';

Future<void> createUserwithEmailAndPassword(BuildContext context, String name,
    String email, String password, bool isTLuser) async {
  try {
    final userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    await createUser(
      name: name,
      email: email,
      userId: userCredential.user!.uid,
      isTLuser: isTLuser,
    );
    context.pop();
  } on FirebaseAuthException catch (e) {
    // TODO
    CustomSnackbar.show(
        context: context, message: e.code, type: SnackbarType.error);
  }
}

Future<void> loginUserwithEmailAndPassword(
  BuildContext context,
  String email,
  String password,
  bool isTLuser,
) async {
  try {
    final userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    print("OOOOOOOOOOOOOO");
    print(userCredential.user);

    if (userCredential.user != null) {
      if (isTLuser) {
        context.push('/tl_login/tlhomepage');
      }
    }
  } on FirebaseAuthException catch (e) {
    // TODO
    CustomSnackbar.show(
        context: context, message: e.code, type: SnackbarType.error);
  }
}
