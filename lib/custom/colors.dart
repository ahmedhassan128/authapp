import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static const Color colorWhite = Colors.white;
  static const Color colorBlack = Colors.black87;
  static const Color colorRed = Colors.red;
  static const Color colorGrey = Colors.grey;
  static const Color colorLightGrey = Color(0xffF5F5F5);
  static const Color lightBlack = Color(0xff8e9ebb);
  static const Color backgroundBlue = Color(0xff0047AB);
  static const primary = Color(0xff00A651);
  static const primaryDark = Color(0xff2B3654);
  static const primaryLight = Color(0xff0CA2DD);
  static const secondary = Color(0xffEE57AC);
  static const green = Color(0xff00A651);
  static const red = Color(0xffE21313);
  static const orangeBg = Color(0xffFFE3CD);
  static const orangeText = Color(0xffFA7D1D);
  static const warning = Color(0xffF38F00);
  static const greyBgLight = Color(0xfffafafa);
  static const backgroundPrimary = Color(0xffffffff);
  static const backgroundSecondary = Color(0xffD9D9D9);
  static const primaryText = Color(0xff2E2E2E);
  static const greyText = Color(0xff606060);
  static const unSelectedColor = Color(0xffE3E5E6);
  static const unSelectedText = Color(0xff7A838B);
  static const selected = Color(0xff0E80D4);
  static const selectedPiek = Color(0xffe84851);
  static const selectedSolar = Color(0xffFFC107);
  static const tabSelected = Color(0xff3F9AED);
  static const border = Color(0xffDDDDE5);
  static const inputPlaceholder = Color(0xff8D9BA3);
  static const kFontColorPallets = [
    Color.fromRGBO(26, 31, 56, 1),
    Color.fromRGBO(72, 76, 99, 1),
    Color.fromRGBO(149, 149, 163, 1),
  ];
  static const Color overviewTabbarColor = Color(0xFFF8AE10);
  static const Color mainTextColor1 = Colors.white;
  static const Color contentColorBlue = Color(0xFF2196F3);
  static const Color contentColorYellow = Color(0xFFFFC300);
  static const Color contentColorGreen = Color(0xFF3BFF49);
  static const Color contentColorPurple = Color(0xFF6E1BFF);

  static const Color darkBlue = Color(0xFF2B3654);
  static const Color textBlue = Color(0xFF002C54);
  static const Color unSelected = Color(0xFFD5D5D5);
  static const Color blue = Color(0xFF1165AA);
  static const Color lightBlue = Color(0xFF0CA2DD);
  static const Color yellow = Color(0xFFf9be3f);

/*  static const LinearGradient blueGradient =
      LinearGradient(colors: [lightBlue, blue]);*/

  static const LinearGradient blueGradient =
      LinearGradient(colors: [lightBlue, blue]);
  static const LinearGradient topBarGradient =
      LinearGradient(colors: [topbarDarkBlueColor, Colors.black]);

  // static const Color dateTimeBlueColor = Color(0xFF225EE3);
  static const Color netGraphBorderColor = Color(0xFF008ffb);
  static const Color netGraphFilledColor = Color(0xFFa6d8fe);
  static const Color netGraphKwartBorderColor = Color(0xFFe84850);
  static const Color netGraphSluimBorderColor = Color(0xFFff6e0d);
  static const Color netGraphSluimFilledColor = Color(0xFFa6d8fe);
  static const Color greyTextColor = Color(0xFF777778);

  static const Color gasGraphFilledColor = Color(0xFFf8af10);
  static const Color chargerGraphFilledColor = Color(0xFFD759E2);
  static const Color topbarDarkBlueColor = Color(0xFF0975B7);
  static const RadialGradient greenRadialGradient =
      RadialGradient(colors: [Color(0xFF0FFF8B), Color(0xFF10AF62)]);
  static const RadialGradient greyRadialGradient =
      RadialGradient(colors: [Color(0xFFD9D9D9), Color(0xFF797979)]);
  static const RadialGradient redRadialGradient =
      RadialGradient(colors: [Color(0xFFF81010), Color(0xFFB41515)]);
  static const Gradient temp = RadialGradient(
    radius: 0.5,
    colors: [
      AppColors.primary,
      AppColors.greyBgLight,
    ],
  );

  static Gradient temp2 = RadialGradient(
    radius: 0.6,
    tileMode: TileMode.clamp,
    focal: Alignment.topCenter,
    colors: [
      AppColors.primary.withOpacity(0.2),
      AppColors.unSelectedColor.withOpacity(0.5),
    ],
  );

  static const temp3 = SweepGradient(
    // begin: Alignment.topRight,
    // end: Alignment.bottomLeft,
    colors: [
      AppColors.primary,
      AppColors.lightBlue,
    ],
  );
}
