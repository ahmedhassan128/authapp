import 'package:authapp/custom/colors.dart';
import 'package:flutter/material.dart';

//////// custom class for button when need button only use custome button class
///// button decoration , color is set in custom class not need to set
///// again decoration and color of button where you want to use  button
class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const PrimaryButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 140,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColors.appbarcolor, Color(0xffED81B4)])),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                color: AppColors.colorBlack,
                fontSize: 20,
                fontWeight: FontWeight.w900),
          ),
        ),
      ),
    );
    // return
  }
}

class ResetButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const ResetButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 250,
        height: 55,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70),
            gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColors.appbarcolor, Color(0xffED81B4)])),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                color: AppColors.colorBlack,
                fontSize: 20,
                fontWeight: FontWeight.w900),
          ),
        ),
      ),
    );
    // return
  }
}
