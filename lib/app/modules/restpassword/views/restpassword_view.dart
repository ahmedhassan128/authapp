import 'package:authapp/app/custom_screens/custom_appbar.dart';
import 'package:authapp/app/routes/app_pages.dart';
import 'package:authapp/custom/colors.dart';
import 'package:authapp/custom/custom_button.dart';
import 'package:authapp/custom/textfield.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/restpassword_controller.dart';

class RestpasswordView extends GetView<RestpasswordController> {
  const RestpasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      } else {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const CustomAppbar(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Form(
                        key: controller.validaterestpassword,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 100),
                            Text(
                              "Email",
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                            CustomTextField(
                                isPassword: false,

                                // controller: _emailController,
                                hintText: 'Email Address',
                                controller: controller.resetemailcontroller,
                                onSaved: (value) {
                                  controller.restemail = value!;
                                },
                                validator: (value) {
                                  return controller.validateEmail(value!);
                                }),
                            const SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: ResetButton(
                                  text: "Reset Password",
                                  onTap: () {
                                    if (controller
                                        .validaterestpassword.currentState!
                                        .validate()) {
                                      controller.resetPassword();
                                    }
                                  }),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Already have an account?",
                                  style: TextStyle(
                                      color: AppColors.colorBlack,
                                      fontSize: 14),
                                ),
                                TextButton(
                                    // if already have account move to login screen
                                    onPressed: () {
                                      Get.toNamed(Routes.LOGIN);
                                    },
                                    child: const Padding(
                                      padding: EdgeInsets.only(right: 20),
                                      child: Text(
                                        "Sign In",
                                        style: TextStyle(
                                          color: Colors.pink,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 290,
                    ),
                    Container(
                      width: 400,
                      height: 50,
                      color: AppColors.buttoncolor,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    }));
  }
}
