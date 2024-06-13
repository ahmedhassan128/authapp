import 'package:get/get.dart';

class SplashWelComeController extends GetxController {
  RxBool isloading = false.obs;
  final userName = ''.obs;

  @override
  void onInit() {
    super.onInit();
    final params = Get.parameters;
    userName.value = params['userName'] ?? '';
  }
}
