import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neuroheal/core/constants/app_colors.dart';

class AppTextStyles {
  // Headings
  static final TextStyle onBoardingHeadding = GoogleFonts.poppins(
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.textDarkColor,
    letterSpacing: 0.15.sp,
  );

  static final TextStyle onBoardingSubHeadding = GoogleFonts.poppins(
    fontSize: 14.sp,
    color: AppColors.textLightDark,
    letterSpacing: 0.15.sp,
  );
  static final TextStyle smallHeadding = GoogleFonts.poppins(
    fontSize: 13.sp,
    fontWeight: FontWeight.w600,

    color: AppColors.textDarkColor,
  );
   static final TextStyle subHeadding = GoogleFonts.poppins(
    fontSize: 16.sp,
    color: AppColors.surfaceColor,
                  fontWeight: FontWeight.w400,
  );
  static final TextStyle appBarHeadding = GoogleFonts.poppins(
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,

    color: AppColors.textDarkColor,
  );
   static final TextStyle buttonText = GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,

    color: AppColors.surfaceColor,
  );
   static final TextStyle appBarHeadding2 = GoogleFonts.poppins(
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,

    color: AppColors.surfaceColor,
  );
}
