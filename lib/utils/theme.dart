import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do/utils/constants.dart';

ThemeData basicThemeData() => ThemeData(
      colorScheme: const ColorScheme.light(primary: MyColors.kPrimaryColor),
      brightness: Brightness.light,
      textTheme: TextTheme(
        
        titleLarge: GoogleFonts.openSans(
          textStyle:  TextStyle(
            color: MyColors.kPrimaryTextColor,
            fontWeight: FontWeight.w700,
            fontSize: 34.sp,
          ),
        ),

        bodyMedium: GoogleFonts.openSans(
          textStyle:  TextStyle(
            color: MyColors.kSecondaryTextColor,
            fontWeight: FontWeight.w600,
            fontSize: 15.sp,
          ),
        ), 

        bodySmall: GoogleFonts.openSans(
          textStyle:  TextStyle(
            color: MyColors.kSecondaryTextColor,
            fontWeight: FontWeight.w400,
            fontSize: 13.sp,
          ),
        ), 
         
      ),
      iconTheme: const IconThemeData(color: MyColors.kIconColor),
      primaryIconTheme: const IconThemeData(
        color: MyColors.kPrimaryTextColor,
      ),
    );
