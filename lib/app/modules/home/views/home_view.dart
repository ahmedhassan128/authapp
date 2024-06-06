import 'dart:io';

import 'package:authapp/custom/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Column(
                  children: [
                    Text(
                      controller.userName.value,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 120),
                    SizedBox(
                      width: 300,
                      height: 200,
                      child: controller.selectedImagePath.value.isEmpty
                          ? const Center(child: Text('No image selected'))
                          : Image.file(
                              File(controller.selectedImagePath.value)),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: 300,
                      height: 50,
                      child: PrimaryButton(
                        text: "Select image",
                        onTap: () {
                          controller.getImage();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        }),
      ),
    );
  }
}



// import 'dart:io';

// import 'package:authapp/custom/custom_button.dart';
// import 'package:flutter/material.dart';

// import 'package:get/get.dart';

// import '../controllers/home_controller.dart';

// class HomeView extends GetView<HomeController> {
//   const HomeView({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('HomeView'),
//           centerTitle: true,
//         ),
//         body: Center(
//           child: Obx(() {
//             if (controller.isLoading.value) {
//               return const Center(child: CircularProgressIndicator());
//             } else {
//               return SizedBox(
//                 width: MediaQuery.of(context).size.width,
//                 height: MediaQuery.of(context).size.height,
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 40),
//                   child: Column(
//                     children: [
//                       Text(
//                         controller.userName.value,
//                         style: const TextStyle(
//                             fontSize: 30,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.blue),
//                       ),
//                       const SizedBox(
//                         height: 120,
//                       ),
//                       SizedBox(
//                         width: 300,
//                         height: 200,
//                         child: controller.selectedImagePath.value.isEmpty
//                             ? const Center(child: Text('No image selected'))
//                             : Image.file(
//                                 File(controller.selectedImagePath.value)),
//                       ),
//                       const SizedBox(
//                         height: 30,
//                       ),
//                       SizedBox(
//                         width: 300,
//                         height: 50,
//                         child: PrimaryButton(
//                             text: "Select image",
//                             onTap: () {
//                               controller.getImage();
//                             }),
//                       )
//                     ],
//                   ),
//                 ),
//               );
//             }
//           }),
//         ));
//   }
// }
