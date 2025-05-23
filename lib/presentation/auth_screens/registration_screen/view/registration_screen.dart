// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:neuroheal/core/common/widget/social_button.dart';
// import 'package:neuroheal/core/common/widget/text_filed.dart';
// import 'package:neuroheal/core/common/widget/screen_background.dart';
// import 'package:neuroheal/core/constants/app_colors.dart';
// import 'package:neuroheal/presentation/auth_screens/login_screen/view/login_screen.dart';
// import 'package:neuroheal/presentation/patient_side/bottom_navigation_screen/view/bottom_navigation.dart';

// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({Key? key}) : super(key: key);

//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   bool _obscurePassword = true;
//   bool _agreeTerms = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: GradientBackground(
//         child: LayoutBuilder(
//           builder: (context, constraints) {
//             return SingleChildScrollView(
//               child: ConstrainedBox(
//                 constraints: BoxConstraints(minHeight: constraints.maxHeight),
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 24.w),
//                   child: IntrinsicHeight(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(height: 40.h),
//                         Text(
//                           'Join us ',
//                           style: GoogleFonts.poppins(
//                             fontSize: 24.sp,
//                             fontWeight: FontWeight.bold,
//                             color: AppColors.textDarkColor,
//                           ),
//                         ),
//                         SizedBox(height: 8.h),
//                         Text(
//                           'Be part of a community that prioritizes mental well-being.',
//                           style: GoogleFonts.poppins(
//                             fontSize: 14.sp,
//                             color: AppColors.textLightDark,
//                           ),
//                         ),
//                         SizedBox(height: 32.h),
//                         buildTextField(
//                           hint: 'Name',
//                           icon: Icons.person_outline,
//                         ),
//                         SizedBox(height: 16.h),
//                         buildTextField(
//                           hint: 'Email',
//                           icon: Icons.email_outlined,
//                         ),
//                         SizedBox(height: 16.h),
//                         buildTextField(
//                           hint: 'Password',
//                           icon: Icons.lock_outline,
//                           isPassword: true,
//                           obscureText: _obscurePassword,
//                           onToggle: () {
//                             setState(() {
//                               _obscurePassword = !_obscurePassword;
//                             });
//                           },
//                         ),
//                         SizedBox(height: 16.h),
//                         Row(
//                           children: [
//                             Flexible(
//                               child: Checkbox(
//                                 value: _agreeTerms,
//                                 onChanged: (value) {
//                                   setState(() {
//                                     _agreeTerms = value ?? false;
//                                   });
//                                 },
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(4.r),
//                                 ),
//                                 side: BorderSide(
//                                   color: const Color.fromARGB(
//                                     255,
//                                     234,
//                                     233,
//                                     233,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Expanded(
//                               child: Text(
//                                 'I agree with the Terms of Service & Privacy Policy',
//                                 style: GoogleFonts.poppins(
//                                   fontSize: 12.sp,
//                                   color: AppColors.textLightDark,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 24.h),
//                         SizedBox(
//                           width: double.infinity,
//                           height: 50.h,
//                           child: ElevatedButton(
//                             onPressed: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => LoginScreen(),
//                                 ),
//                               );
//                             },
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: AppColors.primaryColor,
//                             ),
//                             child: Text(
//                               "Sign up",
//                               style: GoogleFonts.poppins(
//                                 color: AppColors.surfaceColor,
//                                 fontSize: 16.sp,
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 16.h),
//                         Spacer(), // This pushes the button to bottom if there's space
//                         Center(
//                           child: TextButton(
//                             onPressed: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder:
//                                       (context) => BottomNavigationScreen(),
//                                 ),
//                               );
//                             },
//                             child: RichText(
//                               text: TextSpan(
//                                 text: 'Have an account? ',
//                                 style: GoogleFonts.poppins(
//                                   color: AppColors.textLightDark,
//                                   fontSize: 14.sp,
//                                 ),
//                                 children: [
//                                   TextSpan(
//                                     text: 'Log in',
//                                     style: GoogleFonts.poppins(
//                                       color: AppColors.primaryColor,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:neuroheal/core/common/widget/screen_background.dart';
import 'package:neuroheal/core/common/widget/social_button.dart';
import 'package:neuroheal/presentation/auth_screens/controller/auth_controller.dart';
import 'package:neuroheal/presentation/auth_screens/login_screen/view/login_screen.dart';
import 'package:provider/provider.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;
  bool _agreeTerms = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleSignUp() async {
    if (!_formKey.currentState!.validate()) return;

    if (!_agreeTerms) {
      _showErrorSnackBar(
        'Please agree to the Terms of Service & Privacy Policy',
      );
      return;
    }

    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    final success = await authProvider.signUp(
      email: _emailController.text.trim(),
      password: _passwordController.text,
      displayName: _nameController.text.trim(),
    );

    if (success) {
      _showSuccessSnackBar(
        'Account created successfully! Please verify your email.',
      );
      // Navigate to login screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    } else {
      _showErrorSnackBar(authProvider.errorMessage ?? 'Sign up failed');
    }
  }

  // Future<void> _handleGoogleSignUp() async {
  //   final authProvider = Provider.of<AuthProvider>(context, listen: false);

  //   final success = await authProvider.signInWithGoogle();

  //   if (success) {
  //     _navigateToHome();
  //   } else {
  //     _showErrorSnackBar(authProvider.errorMessage ?? 'Google sign up failed');
  //   }
  // }

  // Future<void> _handleFacebookSignUp() async {
  //   final authProvider = Provider.of<AuthProvider>(context, listen: false);

  //   final success = await authProvider.signInWithFacebook();

  //   if (success) {
  //     _navigateToHome();
  //   } else {
  //     _showErrorSnackBar(
  //       authProvider.errorMessage ?? 'Facebook sign up failed',
  //     );
  //   }
  // }

  void _navigateToHome() {
    Navigator.pushReplacementNamed(context, '/home');
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  void _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.green),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    const Text(
                      'Join us to start searching',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'You can search course, apply course and find scholarship for abroad studies',
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                    const SizedBox(height: 32),
                    Row(
                      children: [
                        Expanded(
                          child: socialButton(
                            text: 'Google',
                            imageUrl:
                                "https://cdn4.iconfinder.com/data/icons/logos-brands-7/512/google_logo-google_icongoogle-512.png",
                            onPressed: (){},
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: socialButton(
                            text: 'Facebook',
                            imageUrl:
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdIvVdOSnREtWu96vy1_UbbCXkBYGOoTOkryO-EcdiCwsdFFpqN7IwkPo&s",
                            onPressed:(){},
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    TextFieldWidget(
                      hint: 'Name',
                      icon: Icons.person_outline,
                      controller: _nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        if (value.length < 2) {
                          return 'Name must be at least 2 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFieldWidget(
                      hint: 'Email',
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
                    const SizedBox(height: 16),
                    TextFieldWidget(
                      hint: 'Password',
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
                          return 'Please enter a password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Checkbox(
                          value: _agreeTerms,
                          onChanged: (value) {
                            setState(() {
                              _agreeTerms = value ?? false;
                            });
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          side: const BorderSide(
                            color: Color.fromARGB(255, 234, 233, 233),
                          ),
                        ),
                        const Expanded(
                          child: Text(
                            'I agree with the Terms of Service & Privacy Policy',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Consumer<AuthProvider>(
                      builder: (context, authProvider, child) {
                        return SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed:
                                authProvider.isLoading ? null : _handleSignUp,
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
                                      "Sign up",
                                      style: TextStyle(color: Colors.white),
                                    ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: TextButton(
                        onPressed:
                            () => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            ),
                        child: RichText(
                          text: const TextSpan(
                            text: 'Have an account? ',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14,
                            ),
                            children: [
                              TextSpan(
                                text: 'Log in',
                                style: TextStyle(
                                  color: Color(0xFF00C18A),
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
        ),
      ),
    );
  }
}

Widget TextFieldWidget({
  required String hint,
  required IconData icon,
  TextEditingController? controller,
  bool isPassword = false,
  bool obscureText = false,
  VoidCallback? onToggle,
  String? Function(String?)? validator,
  TextInputType? keyboardType,
}) {
  return TextFormField(
    controller: controller,
    obscureText: isPassword ? obscureText : false,
    keyboardType: keyboardType,
    validator: validator,
    decoration: InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.grey),
      prefixIcon: Icon(icon, color: Colors.grey),
      suffixIcon:
          isPassword
              ? IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
                onPressed: onToggle,
              )
              : null,
      filled: true,
      fillColor: Colors.grey[100],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Color.fromARGB(255, 32, 183, 135),
          width: 2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red, width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    ),
  );
}
