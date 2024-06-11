import 'package:get/get.dart';

import '../controllers/success_controller.dart';

class SuccessfulBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SuccessfulController>(
      () => SuccessfulController(),
    );
  }
}
