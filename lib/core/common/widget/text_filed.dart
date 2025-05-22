import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neuroheal/core/constants/app_colors.dart';

Widget buildTextField({
  required String hint,
  required IconData icon,
  bool isPassword = false,
  bool obscureText = false,
  VoidCallback? onToggle,
}) {
  return TextField(
    obscureText: obscureText,
    decoration: InputDecoration(
      hintText: hint,
      hintStyle: GoogleFonts.poppins(color: AppColors.textDarkColor),
      prefixIcon: Icon(icon),
      suffixIcon:
          isPassword
              ? IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: onToggle,
              )
              : null,
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: const BorderSide(color: Color.fromARGB(255, 255, 251, 251)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: const BorderSide(color: Color.fromARGB(255, 238, 234, 234)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: const BorderSide(color: Color.fromARGB(255, 241, 241, 241)),
      ),
    ),
  );
}
