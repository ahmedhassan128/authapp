import 'dart:io';

import 'package:authapp/custom/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imageList = [
      'assets/images/high_stress.jpg',
      'assets/images/neutral_stress.jpg',
      'assets/images/high_stress.jpg',
      'assets/images/Low_stress.jpg',
      'assets/images/Low_stress.jpg',
      'assets/images/high_stress.jpg',
      'assets/images/neutral_stress.jpg',
    ];
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 252, 148, 183),
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: const Color.fromARGB(255, 252, 148, 183),
      // ),
      body: Center(
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * .3,
                    child: Column(
                      children: [
                        Text(
                          controller.userName.value,
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.pink,
                          ),
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
                          width: 300,
                          height: 126,
                          child: controller.selectedImagePath.value.isEmpty
                              ? const Center(
                                  child: Text('No image selected',
                                      style: TextStyle(color: Colors.pink)))
                              : Image.file(
                                  File(
                                    controller.selectedImagePath.value,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                        ),
                        const SizedBox(height: 18),
                        SizedBox(
                          width: 200,
                          height: 50,
                          child: PrimaryButton(
                            text: "Select image",
                            onTap: () {
                              controller.ImagesourceDialog();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * .7,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          width: 10,
                          color: Color.fromARGB(255, 252, 148, 183),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: imageList.length,
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 300,
                                  crossAxisSpacing: 16,
                                  mainAxisSpacing: 16),
                          itemBuilder: (BuildContext contex, int index) {
                            return Image.asset(
                              imageList[index],
                              fit: BoxFit.cover,
                            );
                          }),
                    ),
                  ),
                  // Text(
                  //   controller.userName.value,
                  //   style: const TextStyle(
                  //     fontSize: 30,
                  //     fontWeight: FontWeight.bold,
                  //     color: Colors.pink,
                  //   ),
                  // ),
                  // const SizedBox(height: 120),
                  // SizedBox(
                  //   width: 300,
                  //   height: 200,
                  //   child: controller.selectedImagePath.value.isEmpty
                  //       ? const Center(
                  //           child: Text('No image selected',
                  //               style: TextStyle(color: Colors.pink)))
                  //       : Image.file(
                  //           File(controller.selectedImagePath.value)),
                  // ),
                  // const SizedBox(height: 30),
                  // SizedBox(
                  //   width: 300,
                  //   height: 50,
                  //   child: PrimaryButton(
                  //     text: "Select image",
                  //     onTap: () {
                  //       controller.ImagesourceDialog();
                  //     },
                  //   ),
                  // ),
                ],
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
