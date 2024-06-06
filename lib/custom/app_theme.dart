import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

/*
  Created by Babar on 2/25/2022.
 */
ThemeData appTheme() {
  return ThemeData(
    fontFamily: GoogleFonts.inter().toString(),
    textTheme: GoogleFonts.interTextTheme(),
    useMaterial3: false,
    tabBarTheme: TabBarTheme(
      labelPadding: const EdgeInsets.symmetric(horizontal: 2),
      labelStyle: TextStyle(
          fontFamily: GoogleFonts.inter().toString(),
          fontSize: 12,
          color: AppColors.primary),
      unselectedLabelStyle: TextStyle(
          fontFamily: GoogleFonts.inter().toString(),
          fontSize: 12,
          color: Colors.grey),
    ),
    appBarTheme: const AppBarTheme(
      elevation: 5,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    dialogTheme: const DialogTheme(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        elevation: 2,
        backgroundColor: Colors.white,
        actionsPadding: EdgeInsets.all(10)),
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 10,
    ),
    primaryColor: AppColors.primary,
    primaryColorDark: AppColors.primary,
    primaryColorLight: AppColors.primaryLight,
    primaryIconTheme: const IconThemeData(color: AppColors.primary),
    colorScheme: ThemeData().colorScheme.copyWith(secondary: AppColors.blue),
    hintColor: const Color(0xffcdd3e0),
    dividerColor: const Color(0xFFCFCFCF),
    scaffoldBackgroundColor: Colors.white,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.primary,
      selectionColor: AppColors.primary,
      selectionHandleColor: AppColors.primary,
    ),
    inputDecorationTheme: InputDecorationTheme(
        border: const OutlineInputBorder(),
        errorStyle: GoogleFonts.inter(
          textStyle: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w300,
            color: Colors.red,
          ),
        ),
        disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
          color: AppColors.border,
        )),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
          color: AppColors.border,
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: AppColors.primary.withOpacity(0.5),
        )),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.red.withOpacity(0.5),
        )),
        labelStyle: GoogleFonts.inter(
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: Colors.grey,
          ),
        ),
        hintStyle: GoogleFonts.inter(
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
        ),
        iconColor: AppColors.primary),
    dividerTheme: const DividerThemeData(
      color: Color(0xffEBECED),
      thickness: 1,
      space: 1,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all<Size>(const Size(100, 50)),
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.pressed)) {
              return AppColors.primary;
            } else if (states.contains(WidgetState.disabled)) {
              return AppColors.colorGrey;
            }
            return AppColors.primary;
          },
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            //side: BorderSide(color: borderColor ?? Colors.transparent),
          ),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
      minimumSize: WidgetStateProperty.all<Size>(const Size(100, 50)),
      foregroundColor: WidgetStateProperty.all<Color>(
        Colors.black,
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          //side: BorderSide(color: borderColor ?? Colors.transparent),
        ),
      ),
    )),
    checkboxTheme: CheckboxThemeData(
        checkColor: WidgetStateProperty.all<Color>(AppColors.colorWhite),
        //fillColor: MaterialStateProperty.all<Color>(AppColors.colorGrey),
        overlayColor: WidgetStateProperty.all<Color>(AppColors.primary),
        splashRadius: 0,
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(
                5)), //RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        visualDensity: VisualDensity.compact,
        side: const BorderSide(
          color: AppColors.colorGrey,
          width: 2,
          style: BorderStyle.solid,
        )),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        backgroundColor: AppColors.colorWhite,
        selectedLabelStyle:
            TextStyle(color: AppColors.primary, fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(color: AppColors.greyText),
        selectedItemColor: AppColors.primary,
        selectedIconTheme: IconThemeData(color: AppColors.primary),
        unselectedItemColor: AppColors.greyText),
  );
}
