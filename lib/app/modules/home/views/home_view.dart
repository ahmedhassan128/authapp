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
      backgroundColor: const Color.fromARGB(255, 252, 148, 183),
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
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * .3,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 45,
                        ),
                        Text(
                          controller.userName.value,
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.pink,
                          ),
                        ),
                        Container(
                          width: 300,
                          height: 110,
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
                        SizedBox(
                          width: 200,
                          height: 45,
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
                          color: const Color.fromARGB(255, 252, 148, 183),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: GridView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: controller.imagePaths.length,
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 300,
                                  crossAxisSpacing: 16,
                                  mainAxisSpacing: 16),
                          itemBuilder: (BuildContext contex, int index) {
                            final imagePath = controller.imagePaths[index];

                            // return Image.file(
                            //   // // File(imagePath),
                            //   // fit: BoxFit.cover,
                            // );
                          }),
                    ),
                  ),
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}
