import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:authapp/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  // final SuccessfulController _successfulController =
  //     Get.find<SuccessfulController>();
  RxBool isLoading = false.obs;
  //////////////change here
  var selectedImagePath = ''.obs;
  RxList<String> imagePaths = <String>[].obs;

  final ImagePicker _picker = ImagePicker();
  final userName = ''.obs;
  final dio.Dio _dio = dio.Dio();
  final _selectedImagePathKey = 'selectedImagePaths';
  @override
  void onInit() {
    super.onInit();
    final params = Get.parameters;
    userName.value = params['userName'] ?? '';
    loadSelectedImagePaths();
  }

  Future<void> loadSelectedImagePaths() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? savedImagePaths =
        prefs.getStringList(_selectedImagePathKey);
    if (savedImagePaths != null) {
      imagePaths.addAll(savedImagePaths);
    }
  }

  Future<void> saveSelectedImagePaths() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_selectedImagePathKey, imagePaths.toList());
  }

  void getImage(ImageSource source) async {
    try {
      isLoading(true);
      final pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        imagePaths.add(pickedFile.path);
        selectedImagePath.value = pickedFile.path;
        ///////////////////c1k94
        await saveSelectedImagePaths();

        Get.toNamed(Routes.Successful, arguments: selectedImagePath.value);
      } else {
        print("Image not selected");
      }
    } catch (e) {
      print("Error picking image: $e");
    } finally {
      isLoading(false);
    }
  }

  void ImagesourceDialog() {
    Get.defaultDialog(
        backgroundColor: const Color.fromARGB(255, 244, 76, 132),
        title: "Select Image source",
        content: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.photo_outlined),
              title: const Text("Gallery"),
              onTap: () {
                Get.back();
                getImage(ImageSource.gallery);
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera),
              title: const Text("Camera"),
              onTap: () {
                getImage(ImageSource.camera);
              },
            )
          ],
        ));
  }
}
