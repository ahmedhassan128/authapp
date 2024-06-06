import 'package:get/get.dart';

import '../controllers/neutral_controller.dart';

class NeutralBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NeutralController>(
      () => NeutralController(),
    );
  }
}
