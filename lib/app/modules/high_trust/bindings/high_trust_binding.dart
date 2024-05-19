import 'package:get/get.dart';

import '../controllers/high_trust_controller.dart';

class HighTrustBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HighTrustController>(
      () => HighTrustController(),
    );
  }
}
