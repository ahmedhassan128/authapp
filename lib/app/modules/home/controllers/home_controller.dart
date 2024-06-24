import 'package:authapp/app/modules/successful/controllers/success_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart' as dio;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:authapp/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  RxBool isLoading = false.obs;
  //////////////change here
  var selectedImagePath = ''.obs;
  RxList<String> imagePaths = <String>[].obs;
  RxList<Map<String, dynamic>> contactList = <Map<String, dynamic>>[].obs;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final ImagePicker _picker = ImagePicker();
  final userName = ''.obs;
  final dio.Dio _dio = dio.Dio();
  final _selectedImagePathKey = 'selectedImagePaths';
  @override
  void onInit() {
    fetchResponseApi(userId);

    final params = Get.parameters;
    userName.value = params['userName'] ?? '';
    // if (Get.arguments != null && Get.arguments is List<Map<String, dynamic>>) {
    //   contactList.value = Get.arguments;
    // }

    // loadSelectedImagePaths();
  }

  // Future<void> loadSelectedImagePaths() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final List<String>? savedImagePaths =
  //       prefs.getStringList(_selectedImagePathKey);
  //   if (savedImagePaths != null) {
  //     imagePaths.addAll(savedImagePaths);
  //   }
  // }

  // Future<void> saveSelectedImagePaths() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setStringList(_selectedImagePathKey, imagePaths.toList());
  // }

  void getImage(ImageSource source) async {
    try {
      isLoading(true);
      final pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        imagePaths.add(pickedFile.path);
        selectedImagePath.value = pickedFile.path;

        ///////////////////c1k94
        // await saveSelectedImagePaths();

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

  String userId = FirebaseAuth.instance.currentUser!.uid;
  Future<void> fetchResponseApi(String userId) async {
    try {
      isLoading(true);
      QuerySnapshot querySnapshot = await _firebaseFirestore
          .collection('ApiResponse')
          .where("UserId", isEqualTo: userId)
          .get();
      List<Map<String, dynamic>> fetchedList = querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
      contactList.value = fetchedList;

      isLoading(false);
    } catch (e) {
      print("Error fetching contacts: $e");
      isLoading(false);
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
