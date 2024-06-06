import 'dart:async';
import 'dart:ffi';

import 'package:authapp/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  RxBool isloading = false.obs;
  @override
  void onInit() {
    super.onInit();
    navigateSignup();
  }

  void navigateSignup() {
    try {
      isloading(true);
      Future.delayed(const Duration(seconds: 3), () {
        Get.toNamed(Routes.SIGNUP);
      });
    } catch (e) {
      print("not working");
    } finally {
      isloading(false);
    }
  }
}
