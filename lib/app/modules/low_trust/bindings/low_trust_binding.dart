import 'package:get/get.dart';

import '../controllers/low_trust_controller.dart';

class LowTrustBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LowTrustController>(
      () => LowTrustController(),
    );
  }
}
