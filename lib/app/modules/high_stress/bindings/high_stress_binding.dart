import 'package:get/get.dart';

import '../controllers/high_stress_controller.dart';

class HighStressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HighStressController>(
      () => HighStressController(),
    );
  }
}
