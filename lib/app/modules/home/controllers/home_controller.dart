import 'package:authapp/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomeController extends GetxController {
  RxBool isLoading = false.obs;
  var selectedImagePath = ''.obs;
  final ImagePicker _picker = ImagePicker();
  final userName = ''.obs;

  @override
  void onInit() {
    super.onInit();
    if (Get.parameters != null) {
      final params = Get.parameters;
      print("userName:$params['userName']");
      userName.value = params['userName'] ?? '';
    }
    print("userName:$userName");
    //userName = ''.obs;
  }

  void getImage() async {
    try {
      isLoading(true);
      final PickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (PickedFile != null) {
        selectedImagePath.value = PickedFile.path;
        Get.toNamed(Routes.HIGH_TRUST);
      } else {
        print("issue ");
      }
    } catch (e) {
      print("Some thing is wrong$e");
    } finally {
      isLoading(false);
    }
  }
}
