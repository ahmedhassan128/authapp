import 'package:authapp/app/modules/login/controllers/login_controller.dart';
import 'package:authapp/custom/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class AwaitScreen extends GetView<LoginController> {
  const AwaitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
                colors: [AppColors.appbarcolor, Color(0xffED81B4)])),
        child: Padding(
          padding: const EdgeInsets.only(top: 300),
          child: Column(
            children: [
              Text('Welcome,\n' 'Qurat!',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.pink)),
            ],
          ),
        ),
      ),
    );
  }
}
