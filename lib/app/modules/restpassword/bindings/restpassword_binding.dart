import 'package:get/get.dart';

import '../controllers/restpassword_controller.dart';

class RestpasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RestpasswordController>(
      () => RestpasswordController(),
    );
  }
}
