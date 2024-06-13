import 'package:authapp/custom/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_welcome_controller.dart';

class SplashWelcomeView extends GetView<SplashWelComeController> {
  const SplashWelcomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomCenter,
                      colors: [AppColors.appbarcolor, Color(0xffED81B4)])),
              child: Padding(
                padding: EdgeInsets.only(top: 350),
                child: Column(
                  children: [
                    Text('Welcome',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.pink)),
                    Text(
                      controller.userName.value,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink,
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
