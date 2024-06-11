import 'package:authapp/app/custom_screens/custom_appbar.dart';
import 'package:authapp/app/routes/app_pages.dart';
import 'package:authapp/custom/colors.dart';
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
      // start body from here  where we write code of view
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return SafeArea(
            child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                // singlechildscrollview for make scrollabel page
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const CustomAppbar(),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          // for validation
                          child: Form(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            key: controller.formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Center(
                                  child: Text(
                                    "Sign Up!",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
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
                                  onSaved: (value) {
                                    controller.name = value!;
                                  },
                                  validator: (value) {
                                    return controller.validatedname(value!);
                                  },
                                ),
                                const SizedBox(
                                  height: 15,
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
                                    onSaved: (value) {
                                      controller.email = value!;
                                    },
                                    validator: (value) {
                                      return controller.validateEmail(value!);
                                    }),
                                const SizedBox(height: 15),
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
                                const SizedBox(height: 15),
                                Text(
                                  "Conform Password",
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                                CustomTextField(
                                  isPassword: true,

                                  controller:
                                      controller.conformpasswordController,
                                  hintText: 'Conform Password',
                                  // obscureText: true,
                                  onSaved: (value) {
                                    controller.confirmpassword = value!;
                                  },
                                  validator: (value) {
                                    return controller.validateconfirmpassword(
                                        controller.passwordController.text,
                                        value!);
                                  },
                                  suffixIcon: Icons.lock,
                                ),
                                const SizedBox(
                                  height: 19,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 300,
                                        height: 30,
                                        child: Row(
                                          children: [
                                            Checkbox(
                                              value: controller.isChecked.value,
                                              onChanged: (Value) {
                                                controller.isChecked.value =
                                                    Value!;
                                              },
                                            ),
                                            const Text(
                                              "I accept the trem and policy",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Center(
                                  child: PrimaryButton(
                                    onTap: () {
                                      if (controller.formKey.currentState!
                                          .validate()) {
                                        controller.register();
                                      }
                                    },
                                    text: "Sign In",
                                  ),
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
                          height: 10,
                        ),
                        Container(
                          width: 400,
                          height: 50,
                          color: AppColors.buttoncolor,
                        ),
                      ],
                    ),
                  ),
                )),
          );
        }
      }),
    );
  }
}
