import 'dart:math';

import 'package:authapp/app/routes/app_pages.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'dart:async';

class SuccessfulController extends GetxController {
  RxBool isloading = false.obs;
  RxString displayText = "Inhale".obs; // Correct initial value to "Inhale"
  Timer? _textToggleTimer;
  Timer? _countdownTimer;
  RxInt timerCount = 18.obs;
  final dio.Dio _dio = dio.Dio();

  String? predictedClass;

  @override
  void onInit() {
    super.onInit();
    startTextToggle();
    final path = Get.arguments as String;
    uploadImage(path);
    startTimer();
    // skipedButton();
  }

  @override
  void onClose() {
    _textToggleTimer?.cancel();
    _countdownTimer?.cancel();
    super.onClose();
  }

  void startTextToggle() {
    _textToggleTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
      displayText.value = displayText.value == "Inhale" ? "Exhale" : "Inhale";
    });
  }

  void startTimer() {
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      print("Timer.tick : ${timer.tick}");
      if (timerCount.value > 0) {
        timerCount.value--;
      } else {
        _countdownTimer?.cancel();
        if (predictedClass != null) {
          navigateToScreen(predictedClass!);
        } else {
          print("Error: Predicted class is not set");
        }
      }
    });
  }

  uploadImage(String path) async {
    String fileName = path.split('/').last;

    dio.FormData formData = dio.FormData.fromMap({
      'file': await dio.MultipartFile.fromFile(path, filename: fileName),
    });

    try {
      dio.Response response = await _dio
          .post("https://coupra.inovixion.com/predict", data: formData);
      if (response.statusCode == 200) {
        print("Status Code is=${response.data}");
        if (response.data != null && response.data['predicted_class'] != null) {
          predictedClass = response.data['predicted_class'];
        } else {
          print("Error: Predicted class is not found");
        }
      } else {}

      // final routes = ['low_stress', 'neutral', 'high_stress'];
      // navigateToScreen(routes[Random().nextInt(3)]);
    } catch (e) {
      print("Error: Something went wrong $e");
    }
  }

  void navigateToScreen(String predictedClass) {
    switch (predictedClass) {
      case 'low_stress':
        Get.toNamed(Routes.LOW_TRUST);
        break;
      case 'neutral':
        Get.toNamed(Routes.HIGH_TRUST);
        break;
      case 'high_stress':
        Get.toNamed(Routes.MEDIUM_TRUST);
        break;
      default:
        print("Unknown class: $predictedClass");
    }
  }

  skipedButton() {
    if (predictedClass != null) {
      navigateToScreen(predictedClass!);
    } else {
      print("Error: Predicted class is not set");
    }
  }
}
