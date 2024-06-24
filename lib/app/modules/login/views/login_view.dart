import 'package:authapp/app/custom_screens/custom_appbar.dart';
import 'package:authapp/app/routes/app_pages.dart';
import 'package:authapp/custom/colors.dart';
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
      body: Obx(() {
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
                        const SizedBox(
                          height: 40,
                        ),
                        const Center(
                          child: Text(
                            "Sign In!",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Form(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            key: controller.loginFormValidation,
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
                                    onSaved: (value) {
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
                                  suffixIcon: Icons.lock,
                                  onSaved: (value) {
                                    controller.password = value!;
                                  },
                                  validator: (value) {
                                    return controller.validatpasseword(value!);
                                  },
                                ),
                                const SizedBox(height: 20),
                                Center(
                                  child: PrimaryButton(
                                    onTap: () {
                                      if (controller
                                          .loginFormValidation.currentState!
                                          .validate()) {
                                        controller.login();
                                      }
                                    },
                                    text: "Login",
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          Get.toNamed(Routes.RESTPASSWORD);
                                        },
                                        child: const Text(
                                          "Forget Password",
                                          style: TextStyle(
                                              color: Colors.pink,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ))
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Center(
                                  child: Text(
                                    "---------OR---------",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(
                                  height: 47,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 90),
                                  child: Column(
                                    children: [
                                      const Text(
                                        "Don't have any account?",
                                        style: TextStyle(
                                            color: AppColors.colorBlack,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            Get.toNamed(Routes.SIGNUP);
                                          },
                                          child: const Text(
                                            "Sign Up",
                                            style: TextStyle(
                                                color: Colors.pink,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        Container(
                          width: 400,
                          height: 45,
                          color: AppColors.buttoncolor,
                        ),
                      ],
                    ),
                  )),
            ),
          );
        }
      }),
    );
  }
}
