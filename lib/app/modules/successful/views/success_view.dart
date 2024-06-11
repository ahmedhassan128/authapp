import 'package:authapp/custom/colors.dart';
import 'package:authapp/custom/custom_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/success_controller.dart';

class SuccessfulView extends GetView<SuccessfulController> {
  const SuccessfulView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      if (controller.isloading.value == true) {
        return const Center(child: CircularProgressIndicator());
      } else {
        return SafeArea(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 400,
                            height: 805,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                    "assets/images/sky_image.jpg",
                                  ),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 140, top: 50),
                            child: Text(
                              "Breathe",
                              style: TextStyle(
                                  color: AppColors.colorWhite,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 175, top: 90),
                            child: Text(
                              "${controller.timerCount.value}",
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: AppColors.colorWhite,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 370, left: 100),
                            child: Lottie.asset("assets/images/lottifile.json",
                                width: 200, height: 200),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 165, top: 450),
                            child: Text(
                              controller.displayText.value,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 238, 235, 235),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 700, left: 70),
                            child: ResetButton(
                                text: "Skip",
                                onTap: () {
                                  controller.skipedButton();
                                }),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }
    }));
  }
}
