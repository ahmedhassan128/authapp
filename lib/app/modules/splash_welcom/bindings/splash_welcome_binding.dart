import 'package:get/get.dart';

import '../controllers/splash_welcome_controller.dart';

class SplashWelComeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashWelComeController>(
      () => SplashWelComeController(),
    );
  }
}
