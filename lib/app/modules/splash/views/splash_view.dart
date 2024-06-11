import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      if (controller.isloading.value == true) {
        return const Center(child: CircularProgressIndicator());
      } else {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: const Color.fromARGB(255, 252, 148, 183),
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 300),
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.asset(
                      "assets/images/logo_bg.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        );
      }
    }));
  }
}
