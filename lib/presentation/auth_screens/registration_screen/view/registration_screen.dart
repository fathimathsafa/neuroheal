import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neuroheal/core/common/widget/social_button.dart';
import 'package:neuroheal/core/common/widget/text_filed.dart';
import 'package:neuroheal/core/common/widget/screen_background.dart';
import 'package:neuroheal/core/constants/app_colors.dart';
import 'package:neuroheal/presentation/auth_screens/login_screen/view/login_screen.dart';
import 'package:neuroheal/presentation/patient_side/bottom_navigation_screen/view/bottom_navigation.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _obscurePassword = true;
  bool _agreeTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GradientBackground(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 40.h),
                        Text(
                          'Join us to start searching',
                          style: GoogleFonts.poppins(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textDarkColor,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          'You can search course, apply course and find scholarship for abroad studies',
                          style: GoogleFonts.poppins(
                            fontSize: 14.sp,
                            color: AppColors.textLightDark,
                          ),
                        ),
                        SizedBox(height: 32.h),
                        buildTextField(
                          hint: 'Name',
                          icon: Icons.person_outline,
                        ),
                        SizedBox(height: 16.h),
                        buildTextField(
                          hint: 'Email',
                          icon: Icons.email_outlined,
                        ),
                        SizedBox(height: 16.h),
                        buildTextField(
                          hint: 'Password',
                          icon: Icons.lock_outline,
                          isPassword: true,
                          obscureText: _obscurePassword,
                          onToggle: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          children: [
                            Flexible(
                              child: Checkbox(
                                value: _agreeTerms,
                                onChanged: (value) {
                                  setState(() {
                                    _agreeTerms = value ?? false;
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.r),
                                ),
                                side: BorderSide(
                                  color: const Color.fromARGB(
                                    255,
                                    234,
                                    233,
                                    233,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'I agree with the Terms of Service & Privacy Policy',
                                style: GoogleFonts.poppins(
                                  fontSize: 12.sp,
                                  color: AppColors.textLightDark,
                                ),
                              ),
                            ),
                          ],
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
                                  builder: (context) => LoginScreen(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryColor,
                            ),
                            child: Text(
                              "Sign up",
                              style: GoogleFonts.poppins(
                                color: AppColors.surfaceColor,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Spacer(), // This pushes the button to bottom if there's space
                        Center(
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => BottomNavigationScreen(),
                                ),
                              );
                            },
                            child: RichText(
                              text: TextSpan(
                                text: 'Have an account? ',
                                style: GoogleFonts.poppins(
                                  color: AppColors.textLightDark,
                                  fontSize: 14.sp,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Log in',
                                    style: GoogleFonts.poppins(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
