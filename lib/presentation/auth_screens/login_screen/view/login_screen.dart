import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neuroheal/core/common/widget/social_button.dart';
import 'package:neuroheal/core/common/widget/text_filed.dart';
import 'package:neuroheal/core/common/widget/screen_background.dart';
import 'package:neuroheal/core/constants/app_colors.dart';
import 'package:neuroheal/presentation/auth_screens/controller/auth_controller.dart';
import 'package:neuroheal/presentation/auth_screens/forget_password_screen/view/forget_password.dart';
import 'package:neuroheal/presentation/auth_screens/registration_screen/view/registration_screen.dart';
import 'package:neuroheal/presentation/doctor_side/my_pateient_screen/view/my_patient_screen.dart';

// class LoginScreen extends StatelessWidget {
//   const LoginScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: GradientBackground(
//         child: SingleChildScrollView(
//           child: Container(
//             padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 60.h),
//             height: size.height,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   "Welcome back",
//                   style: GoogleFonts.poppins(
//                     fontSize: 24.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 8.h),
//                 Text(
//                   "Be part of a community that prioritizes mental well-being.",
//                   textAlign: TextAlign.center,
//                   style: GoogleFonts.poppins(
//                     fontSize: 14.sp,
//                     color: Colors.black54,
//                   ),
//                 ),
//                 // SizedBox(height: 32.h),
//                 // Row(
//                 //   children: [
//                 //     Expanded(
//                 //       child: socialButton(
//                 //         text: 'Google',
//                 //         imageUrl:
//                 //             "https://cdn4.iconfinder.com/data/icons/logos-brands-7/512/google_logo-google_icongoogle-512.png",
//                 //         onPressed: () {},
//                 //       ),
//                 //     ),
//                 //     SizedBox(width: 16.w),
//                 //     Expanded(
//                 //       child: socialButton(
//                 //         text: 'Facebook',
//                 //         imageUrl:
//                 //             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdIvVdOSnREtWu96vy1_UbbCXkBYGOoTOkryO-EcdiCwsdFFpqN7IwkPo&s",
//                 //         onPressed: () {},
//                 //       ),
//                 //     ),
//                 //   ],
//                 // ),
//                 SizedBox(height: 40.h),
//                 buildTextField(
//                   hint: "itsmemamun19@gmail.com",
//                   icon: Icons.email_outlined,
//                 ),
//                 SizedBox(height: 12.h),
//                 buildTextField(
//                   hint: "Password",
//                   icon: Icons.visibility_off,
//                   obscureText: true,
//                 ),
//                 SizedBox(height: 24.h),
//                 SizedBox(
//                   width: double.infinity,
//                   height: 50.h,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => MyPatientsScreen(),
//                         ),
//                       );
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: AppColors.primaryColor,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12.r),
//                       ),
//                     ),
//                     child: Text(
//                       "Login",
//                       style: GoogleFonts.poppins(
//                         color: AppColors.surfaceColor,
//                         fontSize: 16.sp,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 12.h),
//                 TextButton(
//                   onPressed: () {
//                     showModalBottomSheet(
//                       context: context,
//                       isScrollControlled: true,
//                       backgroundColor: Colors.transparent,
//                       builder:
//                           (context) => Padding(
//                             padding: EdgeInsets.only(
//                               bottom: MediaQuery.of(context).viewInsets.bottom,
//                             ),
//                             child: const ForgotPasswordBottomSheet(),
//                           ),
//                     );
//                   },
//                   child: Text(
//                     "Forgot password",
//                     style: GoogleFonts.poppins(
//                       color: AppColors.primaryColor,
//                       fontWeight: FontWeight.w600,
//                       fontSize: 14.sp,
//                     ),
//                   ),
//                 ),
//                 const Spacer(),
//                 GestureDetector(
//                   onTap: () {
//                     // Handle "Join us" tap
//                   },
//                   child: Text.rich(
//                     TextSpan(
//                       text: "Don't have an account? ",
//                       style: GoogleFonts.poppins(
//                         fontSize: 14.sp,
//                         color: Colors.black54,
//                       ),
//                       children: [
//                         TextSpan(
//                           text: "Join us",
//                           style: GoogleFonts.poppins(
//                             color: const Color.fromARGB(255, 32, 183, 135),
//                             fontWeight: FontWeight.bold,
//                             fontSize: 14.sp,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20.h), // Padding below bottom text
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) return;

    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    final success = await authProvider.signIn(
      email: _emailController.text.trim(),
      password: _passwordController.text,
    );

    if (success) {
      _navigateToHome();
    } else {
      _showErrorSnackBar(authProvider.errorMessage ?? 'Login failed');
    }
  }

  // Future<void> _handleGoogleLogin() async {
  //   final authProvider = Provider.of<AuthProvider>(context, listen: false);

  //   final success = await authProvider.signInWithGoogle();

  //   if (success) {
  //     _navigateToHome();
  //   } else {
  //     _showErrorSnackBar(authProvider.errorMessage ?? 'Google login failed');
  //   }
  // }

  // Future<void> _handleFacebookLogin() async {
  //   final authProvider = Provider.of<AuthProvider>(context, listen: false);

  //   final success = await authProvider.signInWithFacebook();

  //   if (success) {
  //     _navigateToHome();
  //   } else {
  //     _showErrorSnackBar(authProvider.errorMessage ?? 'Facebook login failed');
  //   }
  // }

  void _navigateToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MyPatientsScreen()),
    );
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: GradientBackground(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
            height: size.height,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Welcome back",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "You can search course, apply course and find scholarship for abroad studies",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      Expanded(
                        child: socialButton(
                          text: 'Google',
                          imageUrl:
                              "https://cdn4.iconfinder.com/data/icons/logos-brands-7/512/google_logo-google_icongoogle-512.png",
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: socialButton(
                          text: 'Facebook',
                          imageUrl:
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdIvVdOSnREtWu96vy1_UbbCXkBYGOoTOkryO-EcdiCwsdFFpqN7IwkPo&s",
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  TextFieldWidget(
                    hint: "Email",
                    icon: Icons.email_outlined,
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(
                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                      ).hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  TextFieldWidget(
                    hint: "Password",
                    icon: Icons.lock_outline,
                    controller: _passwordController,
                    isPassword: true,
                    obscureText: _obscurePassword,
                    onToggle: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  Consumer<AuthProvider>(
                    builder: (context, authProvider, child) {
                      return ElevatedButton(
                        onPressed: authProvider.isLoading ? null : _handleLogin,
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          backgroundColor: const Color.fromARGB(
                            255,
                            32,
                            183,
                            135,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child:
                            authProvider.isLoading
                                ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                                : const Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder:
                            (context) => Padding(
                              padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom,
                              ),
                              child: const ForgotPasswordBottomSheet(),
                            ),
                      );
                    },
                    child: const Text(
                      "Forgot password",
                      style: TextStyle(
                        color: Color.fromARGB(255, 32, 183, 135),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ),
                      );
                    },
                    child: Text.rich(
                      TextSpan(
                        text: "Don't have an account? ",
                        children: [
                          TextSpan(
                            text: 'Sign Up',
                            // text: "Join us",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 32, 183, 135),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
