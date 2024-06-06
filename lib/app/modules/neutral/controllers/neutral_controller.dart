import 'dart:async';

import 'package:get/get.dart';

class NeutralController extends GetxController {
  //TODO: Implement HighTrustController
  Timer? _timer;
  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 3), () {
      Get.back();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
