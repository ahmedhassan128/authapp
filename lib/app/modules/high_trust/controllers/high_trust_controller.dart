import 'dart:async';

import 'package:get/get.dart';

class HighTrustController extends GetxController {
  //TODO: Implement HighTrustController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    Timer(Duration(seconds: 2), () {
      Get.back();
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
