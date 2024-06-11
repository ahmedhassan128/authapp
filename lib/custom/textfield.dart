import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final bool isPassword;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final String hintText;
  final IconData? prefixicon;
  final IconData? suffixIcon;
  final int maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final void Function(String?)? onSaved;

  const CustomTextField({
    super.key,
    this.maxLines = 1,
    this.keyboardType,
    this.inputFormatters,
    required this.isPassword,
    required this.controller,
    this.validator,
    required this.hintText,
    this.onSaved,
    this.prefixicon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword,
      validator: validator,
      controller: controller,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      maxLines: maxLines,
      onSaved: onSaved,
      decoration: InputDecoration(
        suffixIcon: suffixIcon != null
            ? Icon(suffixIcon, size: 20, color: Colors.black)
            : null,
        prefixIcon: prefixicon != null
            ? Icon(prefixicon, size: 20, color: Colors.black)
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(
            color: Color.fromARGB(221, 17, 1, 1),
            width: 2,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(
            color: Color.fromARGB(221, 17, 1, 1),
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(
            color: Colors.blue, // Use a distinct color to see the focus change
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
        hintText: hintText,
        fillColor: Colors.white,
        filled: true,
      ),
    );
  }
}



// import 'package:authapp/custom/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class CustomTextField extends StatelessWidget {
//   final bool isPassword;
//   final String? Function(String?)? validator;
//   final TextEditingController controller;
//   final String hintText;
//   final IconData? prefixicon;
//   final IconData? suffixIcon;
//   final int maxLines;
//   final List<TextInputFormatter>? inputFormatters;
//   final TextInputType? keyboardType;
//   // add for validate
//   final onSaved;
//   const CustomTextField({
//     super.key,
//     this.maxLines = 1,
//     this.keyboardType,
//     this.inputFormatters,
//     required this.isPassword,
//     required this.controller,
//     this.validator,
//     required this.hintText,
//     required Null Function(dynamic value) Function,
//     this.onSaved,
//     this.prefixicon,
//     this.suffixIcon,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       obscureText: isPassword,
//       validator: validator,
//       controller: controller,
//       inputFormatters: inputFormatters,
//       keyboardType: keyboardType,
//       maxLines: maxLines,
//       decoration: InputDecoration(
//         suffixIcon: Icon(
//           suffixIcon,
//           size: 20,
//           color: Colors.black,
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(100),
//           borderSide: BorderSide(
//             color: const Color.fromARGB(221, 17, 1, 1),
//             width: 2,
//           ),
//         ),
//         disabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(100),
//           borderSide: BorderSide(
//             color: const Color.fromARGB(221, 17, 1, 1),
//             width: 2,
//           ),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(100),
//           borderSide: BorderSide(
//             color: const Color.fromARGB(221, 17, 1, 1),
//             width: 2,
//           ),
//         ),
//         errorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(100),
//           borderSide: BorderSide(
//             color: const Color.fromARGB(221, 17, 1, 1),
//             width: 2,
//           ),
//         ),
//         hintText: hintText,
//         fillColor: Colors.white,
//         filled: true,
//       ),
//     );
//   }
// }
