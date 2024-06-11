import 'package:authapp/custom/colors.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1,
      height: MediaQuery.of(context).size.height * 0.1,
      color: AppColors.appbarcolor,
      child: Column(
        children: [
          Image.asset(
            "assets/images/logo_bg.png",
            width: 80,
            height: 80,
          )
        ],
      ),
    );
  }
}
