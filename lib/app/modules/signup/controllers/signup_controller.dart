import 'package:authapp/app/modules/home/views/home_view.dart';
import 'package:authapp/app/modules/login/views/login_view.dart';
import 'package:authapp/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // FirebaseDatabase database = FirebaseDatabase.instance;
  final emailController = TextEditingController();
  final fullNameController = TextEditingController();
  final passwordController = TextEditingController();
  final conformpasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // bool? _hasBioSensor;
  RxBool isLoading = false.obs;

  var email = '';
  var name = '';
  var password = '';
  var confirmpassword = '';
  @override
  void onInit() {
    super.onInit();
  }

  void clear() {
    emailController.clear();
    fullNameController.clear();
    passwordController.clear();
    conformpasswordController.clear();
  }

  validatedname(String value) {
    if (value.isEmpty) {
      return "Please enter full name.";
    } else {
      return null;
    }
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

  validateconfirmpassword(String password, String confirmpassword) {
    if (confirmpassword.isEmpty) {
      return "Confirm password can not be empty";
    } else if (confirmpassword != password) {
      return "Password do not match";
    } else if (confirmpassword == password) {
      return null;
    }
  }

  Future<void> register() async {
    try {
      isLoading(true);
      email = emailController.text;
      name = fullNameController.text;
      password = passwordController.text;
      confirmpassword = conformpasswordController.text;
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Get the user's ID
      String userId = userCredential.user!.uid;
      //Write user data to Realtime Database
      await firestore.collection('users').doc(userId).set({
        'email': email,
        'name': name,
        'password': password,
        'confirmpassword': confirmpassword,
      });

      clear();
      Get.toNamed(Routes.LOGIN);
    } catch (e) {
      print("Register Exception is : $e");
    } finally {
      isLoading(false);
    }
  }
}
