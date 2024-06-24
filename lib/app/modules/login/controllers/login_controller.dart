import 'package:authapp/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> loginFormValidation = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  RxBool isLoading = false.obs;
  var email = '';
  var password = '';

  void clear() {
    passwordController.clear();
    emailController.clear();
  }

  validateEmail(String value) {
    if (value.isEmpty) {
      return "Please enter valid email address";
    } else if (!GetUtils.isEmail(value)) {
      return "Invalid email format";
    }
    return null;
  }

  validatpasseword(String value) {
    if (value.isEmpty) {
      return "Please enter your password";
    } else if (value.length < 6) {
      return "Password must be at 6 characters";
    }
    return null;
  }

  Future<void> login() async {
    if (!loginFormValidation.currentState!.validate()) {
      return;
    }

    try {
      isLoading(true);
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // Get the user's ID
      String userId = userCredential.user!.uid;
// get user name from firestore database and current user name show on home screen
      DocumentSnapshot userDoc =
          await firestore.collection('users').doc(userId).get();
      String userName = userDoc['name'];

      clear();

      Get.toNamed(Routes.SplashWelcome, parameters: {"userName": userName});
      await Future.delayed(const Duration(seconds: 4));
      Get.offAndToNamed(Routes.HOME, parameters: {"userName": userName});
    } catch (e) {
      Get.snackbar("Login Error", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading(false);
    }
  }
}
