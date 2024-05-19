import 'package:authapp/app/modules/restpassword/views/restpassword_view.dart';
import 'package:authapp/app/modules/signup/views/signup_view.dart';
import 'package:authapp/app/routes/app_pages.dart';
import 'package:authapp/custom/colors.dart';
import 'package:authapp/custom/custom_button.dart';
import 'package:authapp/custom/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
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
                                child: Text(
                                  "Forget Password",
                                  style: TextStyle(color: Colors.deepPurple),
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
                                  TextStyle(color: Colors.black, fontSize: 14),
                            ),
                            TextButton(
                                onPressed: () {
                                  Get.toNamed(Routes.SIGNUP);
                                },
                                child: const Text(
                                  "Create one",
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