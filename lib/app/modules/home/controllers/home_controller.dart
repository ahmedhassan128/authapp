import 'dart:math';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:authapp/app/routes/app_pages.dart';

class HomeController extends GetxController {
  RxBool isLoading = false.obs;
  var selectedImagePath = ''.obs;
  final ImagePicker _picker = ImagePicker();
  final userName = ''.obs;
  // final dio.Dio _dio = dio.Dio();

  @override
  void onInit() {
    super.onInit();
    final params = Get.parameters;
    userName.value = params['userName'] ?? '';
  }

  void getImage() async {
    try {
      isLoading(true);
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        selectedImagePath.value = pickedFile.path;
        await uploadImage(pickedFile.path);
      } else {
        print("Image not selected");
      }
    } catch (e) {
      print("Error picking image: $e");
    } finally {
      isLoading(false);
    }
  }

  Future<void> uploadImage(String path) async {
    String fileName = path.split('/').last;

    dio.FormData formData = dio.FormData();
    formData.files.add(
      MapEntry(
        'file',
        await dio.MultipartFile.fromFile(path, filename: fileName),
      ),
    );

    try {
      // // dio.Response response =
      // //     // await _dio.post("http://localhost:8000/predict", data: formData);

      //   if (response.statusCode == 200) {
      //     print("Status Code is=${response.data}");
      //     if (response.data != null && response.data['predicted_class'] != null) {
      //       String predictedClass = response.data['predicted_class'];
      //       navigateToScreen(predictedClass);
      //     } else {
      //       print("Error = Predicted class is not found");
      //   //   }
      //   }

      // }else{
      //   print("");
      //  }

      final routes = ['low_stress', 'neutral', 'high_stress'];
      navigateToScreen(routes[Random().nextInt(3)]);
    } catch (e) {
      print("Some thing wrong");
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
}
