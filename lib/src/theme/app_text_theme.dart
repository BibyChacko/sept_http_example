
// Contains all the text theme used in the application

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

// 6 Heading Sizes   -- h1 -- h6  -->
class AppTextTheme{

  static final TextStyle h1Style = GoogleFonts.exo2(
    fontSize: 22,
    fontWeight: FontWeight.w800,
    color: AppColors.textColor,
    wordSpacing: 4,
    height: 2,
  );

  static final TextStyle h2Style = h1Style.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w700
  );

  static final TextStyle h6Style = h1Style.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w500
  );

  static final TextStyle bodyStyle = h1Style.copyWith(
      fontSize: 12,
      color: Colors.blueGrey,
      fontWeight: FontWeight.w300
  );

  static final TextStyle buttonTextStyle = h1Style.copyWith(
      fontSize: 14,
      color: Colors.white,
      fontWeight: FontWeight.w500
  );


}

