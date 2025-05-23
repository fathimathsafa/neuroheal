import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neuroheal/core/common/widget/screen_background.dart';
import 'package:neuroheal/core/constants/app_colors.dart';
import 'package:neuroheal/presentation/auth_screens/registration_screen/view/registration_screen.dart';
import 'package:neuroheal/presentation/common_screens/help_center_screen/view/help_center_screen.dart';
import 'package:neuroheal/presentation/doctor_side/all_record_screen/view/all_record_screen.dart';

class DoctorProfileScreen extends StatelessWidget {
  const DoctorProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios_new, size: 20.sp),
                    onPressed: () => Navigator.pop(context),
                  ),
                  SizedBox(width: 24.w),
                  Flexible(
                    child: Text(
                      'Doctor Details',
                      style: GoogleFonts.poppins(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            CircleAvatar(
              radius: 45.r,
              backgroundImage: const AssetImage(
                'assets/live_chat/live_chat.jpg',
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              "Abdullah Mamun",
              style: GoogleFonts.poppins(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryColor,
              ),
            ),
            Text(
              "@1098-167289",
              style: GoogleFonts.poppins(
                fontSize: 14.sp,
                color: AppColors.textLightDark,
              ),
            ),
            SizedBox(height: 30.h),

            // Options
            _buildOption(
              context,
              icon: Icons.add_circle_outline,
              label: "Add Medical Record",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AllRecordsScreen()),
                );
              },
            ),
            _buildOption(
              context,
              icon: Icons.help_outline,
              label: "Help Center",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HelpCenterScreen()),
                );
              },
            ),
            _buildOption(
              context,
              icon: Icons.privacy_tip_outlined,
              label: "Privacy & Policy",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) =>
                            const PlaceholderScreen(title: "Privacy & Policy"),
                  ),
                );
              },
            ),
            _buildOption(
              context,
              icon: Icons.settings_outlined,
              label: "Settings",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => const PlaceholderScreen(title: "Settings"),
                  ),
                );
              },
            ),
            _buildOption(
              context,
              icon: Icons.logout,
              label: "Logout",
              iconColor: Colors.white,
              textColor: Colors.white,
              onTap: () {
                showDialog(
                  context: context,
                  builder:
                      (context) => AlertDialog(
                        title: Text(
                          "Logout",
                          style: TextStyle(fontSize: 18.sp),
                        ),
                        content: Text(
                          "Are you sure you want to logout?",
                          style: TextStyle(fontSize: 15.sp),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text(
                              "Cancel",
                              style: TextStyle(fontSize: 14.sp),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUpScreen(),
                                ),
                              );
                            },
                            child: Text(
                              "Logout",
                              style: GoogleFonts.poppins(fontSize: 14.sp),
                            ),
                          ),
                        ],
                      ),
                );
              },
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    Color iconColor = Colors.black,
    Color textColor = Colors.black,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      child: Material(
        color: Colors.black.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12.r),
        child: ListTile(
          tileColor: AppColors.primaryColor,
          contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 2.h),
          leading: Icon(icon, color: AppColors.surfaceColor, size: 22.sp),
          title: Text(
            label,
            style: GoogleFonts.poppins(
              color: AppColors.surfaceColor,
              fontSize: 15.sp,
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,

            color: AppColors.surfaceColor,
            size: 16.sp,
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}

class PlaceholderScreen extends StatelessWidget {
  final String title;
  const PlaceholderScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, size: 18.sp),
        ),
        title: Text(title, style: TextStyle(fontSize: 18.sp)),
        backgroundColor: const Color.fromARGB(104, 47, 131, 96),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Text(
          "Content for $title goes here.",
          style: TextStyle(fontSize: 18.sp),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
