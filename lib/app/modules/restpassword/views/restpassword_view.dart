import 'package:authapp/custom/custom_button.dart';
import 'package:authapp/custom/textfield.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/restpassword_controller.dart';

class RestpasswordView extends GetView<RestpasswordController> {
  const RestpasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Respassword'),
          centerTitle: true,
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Padding(
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
                          Function: (value) {
                            controller.restemail = value!;
                          },
                          validator: (value) {
                            return controller.validateEmail(value!);
                          }),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        width: 300,
                        height: 50,
                        child: PrimaryButton(
                            text: "Reset Password",
                            onTap: () {
                              if (controller.validaterestpassword.currentState!
                                  .validate()) {
                                controller.resetPassword();
                              }
                            }),
                      )
                    ],
                  ),
                ),
              ),
            );
          }
        }));
  }
}
