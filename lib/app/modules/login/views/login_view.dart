import 'package:authapp/app/routes/app_pages.dart';
import 'package:authapp/custom/custom_button.dart';
import 'package:authapp/custom/textfield.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/login_controller.dart';

// same process like signup but login code is change
class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 252, 148, 183),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 252, 148, 183),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: controller.validateform,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
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
                            controller: controller.emailController,
                            Function: (value) {
                              controller.email = value!;
                            },
                            validator: (value) {
                              return controller.validateEmail(value!);
                            }),
                        const SizedBox(height: 20),
                        Text(
                          "Password",
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        CustomTextField(
                          isPassword: true,
                          controller: controller.passwordController,
                          hintText: 'Password',
                          Function: (value) {
                            controller.password = value!;
                          },
                          validator: (value) {
                            return controller.validatpasseword(value!);
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Get.toNamed(Routes.RESTPASSWORD);
                                },
                                child: const Text(
                                  "Forget Password",
                                  style: TextStyle(color: Colors.pink),
                                ))
                          ],
                        ),
                        const SizedBox(height: 20),
                        PrimaryButton(
                          onTap: () {
                            if (controller.validateform.currentState!
                                .validate()) {
                              controller.login();
                            }
                          },
                          text: "Login",
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have a account?",
                              style:
                                  TextStyle(color: Colors.pink, fontSize: 14),
                            ),
                            TextButton(
                                onPressed: () {
                                  Get.toNamed(Routes.SIGNUP);
                                },
                                child: const Text(
                                  "Create one",
                                  style: TextStyle(
                                      color: Colors.pink, fontSize: 14),
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ));
        }
      }),
    );
  }
}
