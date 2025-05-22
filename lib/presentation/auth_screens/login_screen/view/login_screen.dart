import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neuroheal/core/common/widget/social_button.dart';
import 'package:neuroheal/core/common/widget/text_filed.dart';
import 'package:neuroheal/core/common/widget/screen_background.dart';
import 'package:neuroheal/core/constants/app_colors.dart';
import 'package:neuroheal/presentation/auth_screens/forget_password_screen/view/forget_password.dart';
import 'package:neuroheal/presentation/doctor_side/my_pateient_screen/view/my_patient_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GradientBackground(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 60.h),
            height: size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome back",
                  style: GoogleFonts.poppins(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  "You can search course, apply course and find scholarship for abroad studies",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    color: Colors.black54,
                  ),
                ),
                // SizedBox(height: 32.h),
                // Row(
                //   children: [
                //     Expanded(
                //       child: socialButton(
                //         text: 'Google',
                //         imageUrl:
                //             "https://cdn4.iconfinder.com/data/icons/logos-brands-7/512/google_logo-google_icongoogle-512.png",
                //         onPressed: () {},
                //       ),
                //     ),
                //     SizedBox(width: 16.w),
                //     Expanded(
                //       child: socialButton(
                //         text: 'Facebook',
                //         imageUrl:
                //             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdIvVdOSnREtWu96vy1_UbbCXkBYGOoTOkryO-EcdiCwsdFFpqN7IwkPo&s",
                //         onPressed: () {},
                //       ),
                //     ),
                //   ],
                // ),
                SizedBox(height: 40.h),
                buildTextField(
                  hint: "itsmemamun19@gmail.com",
                  icon: Icons.email_outlined,
                ),
                SizedBox(height: 12.h),
                buildTextField(
                  hint: "Password",
                  icon: Icons.visibility_off,
                  obscureText: true,
                ),
                SizedBox(height: 24.h),
                SizedBox(
                  width: double.infinity,
                  height: 50.h,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyPatientsScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    child: Text(
                      "Login",
                      style: GoogleFonts.poppins(
                        color: AppColors.surfaceColor,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder:
                          (context) => Padding(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom,
                            ),
                            child: const ForgotPasswordBottomSheet(),
                          ),
                    );
                  },
                  child: Text(
                    "Forgot password",
                    style: GoogleFonts.poppins(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    // Handle "Join us" tap
                  },
                  child: Text.rich(
                    TextSpan(
                      text: "Don't have an account? ",
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        color: Colors.black54,
                      ),
                      children: [
                        TextSpan(
                          text: "Join us",
                          style: GoogleFonts.poppins(
                            color: const Color.fromARGB(255, 32, 183, 135),
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.h), // Padding below bottom text
              ],
            ),
          ),
        ),
      ),
    );
  }
}
