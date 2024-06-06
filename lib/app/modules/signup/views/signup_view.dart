import 'package:authapp/app/routes/app_pages.dart';
import 'package:authapp/custom/custom_button.dart';
import 'package:authapp/custom/textfield.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/signup_controller.dart';

// this is signup view page when build application show this page for register user
class SignupView extends GetView<SignupController> {
  const SignupView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //for appbar
        title: const Text('SignupView'),
        centerTitle: true,
      ),
      // start body from here  where we write code of view
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              // singlechildscrollview for make scrollabel page
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  // for validation
                  child: Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        // text field name
                        Text(
                          "Full Name",
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        // textfield  i have created custome textfield
                        // apple validation on textfield
                        // same process for all textfield
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
                                // if already have account move to login screen
                                onPressed: () {
                                  Get.toNamed(Routes.LOGIN);
                                },
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.deepPurple, fontSize: 14),
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
