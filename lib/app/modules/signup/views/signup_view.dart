import 'package:authapp/app/routes/app_pages.dart';
import 'package:authapp/custom/colors.dart';
import 'package:authapp/custom/custom_button.dart';
import 'package:authapp/custom/textfield.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignupView'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          "Full Name",
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        CustomTextField(
                          isPassword: false,
                          hintText: 'Full Name',
                          controller: controller.fullNameController,
                          Function: (value) {
                            controller.name = value!;
                          },
                          validator: (value) {
                            return controller.validatedname(value!);
                          },
                        ),
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
                        const SizedBox(height: 20),
                        Text(
                          "Conform Password",
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        CustomTextField(
                          isPassword: true,

                          controller: controller.conformpasswordController,
                          hintText: 'Conform Password',
                          // obscureText: true,
                          Function: (value) {
                            controller.confirmpassword = value!;
                          },
                          validator: (value) {
                            return controller.validateconfirmpassword(
                                controller.passwordController.text, value!);
                          },
                        ),
                        const SizedBox(height: 20),
                        PrimaryButton(
                          onTap: () {
                            if (controller.formKey.currentState!.validate()) {
                              controller.register();
                            }
                          },
                          text: "Register",
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Already have an account?",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14),
                            ),
                            TextButton(
                                onPressed: () {
                                  Get.toNamed(Routes.LOGIN);
                                },
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                      color: MyColors.kPrimaryColor,
                                      fontSize: 14),
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
