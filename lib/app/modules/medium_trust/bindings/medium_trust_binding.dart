import 'package:get/get.dart';

import '../controllers/medium_trust_controller.dart';

class MediumTrustBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MediumTrustController>(
      () => MediumTrustController(),
    );
  }
}
