import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoppe/core/theming/colors.dart';

class Styles {

  static final TextStyle font52BlackBold = TextStyle(
    fontSize: 52.sp,
    fontWeight: FontWeight.bold,
    color:ColorsManager.black,
  );
  static final TextStyle font15LightGrayW500 =  TextStyle(
    fontSize: 15.sp,
    color: ColorsManager.lightGray,
    fontWeight: FontWeight.w500,
  );
  static final TextStyle font20BlackW500 =  TextStyle(
    fontSize: 20.sp,
    color: ColorsManager.black,
    fontWeight: FontWeight.w500,
  );
  static final TextStyle font20W600Roboto = GoogleFonts.roboto(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
  );
  static final TextStyle font19W500AnekLatin = GoogleFonts.anekLatin(
    fontSize: 19.sp,
    fontWeight: FontWeight.w500,
  );
  static final TextStyle font15BlackW500 =TextStyle(
    fontSize: 15.sp,
    color: ColorsManager.black,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle font18BlackW200 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w200,
    color:ColorsManager.black,
  );

  static final TextStyle appTextButtonStyle = GoogleFonts.anekLatin(
    fontSize: 19.sp,
    fontWeight: FontWeight.w500,
    color: ColorsManager.white
  );
  static final TextStyle  font22WhiteNunito =  TextStyle(
      fontFamily: 'NunitoSans',
      fontSize: 22.sp,
      color: ColorsManager.white);
  static final TextStyle  font18BlackNunito =  TextStyle(
      fontFamily: 'NunitoSans',
      fontSize: 18.sp,
      color: ColorsManager.black);
  static final TextStyle  font16NunitoW200  =  TextStyle(
      fontSize: 16.sp,fontWeight: FontWeight.w200,
      fontFamily: 'NunitoSans'
  );
  static TextStyle font14GrayRegular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: ColorsManager.gray,
  );
  static TextStyle font14DarkBlueMedium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: ColorsManager.darkBlue,
  );
  static  TextStyle font15blueW400= TextStyle(
    fontSize: 15.sp,
    color: ColorsManager.blue,
    fontWeight: FontWeight.w400,
  );
  static TextStyle font17BlackW400 = TextStyle(
    fontSize: 17.sp,
    color: ColorsManager.black,
    fontWeight: FontWeight.w400,
  );

}