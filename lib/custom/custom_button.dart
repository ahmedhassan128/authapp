import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//////// custom class for button when need button only use custome button class
///// button decoration , color is set in custom class not need to set 
///// again decoration and color of button where you want to use  button 
class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const PrimaryButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(double.maxFinite, 53),
            backgroundColor: const Color.fromRGBO(106, 98, 183, 1),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: Text(
          text,
          style: GoogleFonts.poppins(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
        ));
  }
}
