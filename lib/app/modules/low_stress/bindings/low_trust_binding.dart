import 'package:get/get.dart';

import '../controllers/low_trust_controller.dart';

class LowStressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LowStresstController>(
      () => LowStresstController(),
    );
  }
}
