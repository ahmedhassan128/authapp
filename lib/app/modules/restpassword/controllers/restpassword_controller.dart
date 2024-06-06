import 'package:authapp/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class RestpasswordController extends GetxController {
  TextEditingController resetemailcontroller = TextEditingController();
  GlobalKey<FormState> validaterestpassword = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;
  var restemail = '';

  validateEmail(String value) {
    if (value.isEmpty) {
      return "Please enter valid email address";
    } else if (!GetUtils.isEmail(value)) {
      return "Invalid email format";
    }
    return null;
  }

  void resetPassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: resetemailcontroller.text);
      Get.snackbar('Success',
          'Password reset email sent to ${resetemailcontroller.text}');

      // Show success message or navigate to a success screen
      // Navigate to login screen
      Get.toNamed(Routes.LOGIN); // Replace 'Routes.LOGIN' with your login route
    } catch (e) {
      // Show error message
      Get.snackbar('Error', 'Failed to send password reset email: $e');
    }
  }
}
