import 'package:authapp/app/modules/home/controllers/home_controller.dart';
import 'package:authapp/app/modules/home/views/home_view.dart';
import 'package:authapp/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> validateform = GlobalKey<FormState>();
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
    if (!validateform.currentState!.validate()) {
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
// get user name from firestore database
      DocumentSnapshot userDoc =
          await firestore.collection('users').doc(userId).get();
      String userName = userDoc['name'];

      clear();

      // Pass the user's name to HomeView controller
      //Get.find<HomeController>().userName.value = userName;

      // Navigate to HomeView
      //Get.offAll(() => HomeView());
      print("userName:$userName");
      Get.offAndToNamed(Routes.HOME, parameters: {"userName": userName});
    } catch (e) {
      Get.snackbar("Login Error", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading(false);
    }
  }
}
