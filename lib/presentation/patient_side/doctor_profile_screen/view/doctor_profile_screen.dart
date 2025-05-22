import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuroheal/presentation/auth_screens/registration_screen/view/registration_screen.dart';
import 'package:neuroheal/presentation/common_screens/help_center_screen/view/help_center_screen.dart';
import 'package:neuroheal/presentation/doctor_side/all_record_screen/view/all_record_screen.dart';

class ModelProfileScreen extends StatelessWidget {
  const ModelProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 85, 231, 197), // Your color
              Color.fromARGB(255, 226, 228, 232),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            _buildHeader(context),
            const CircleAvatar(
              radius: 45,
              backgroundImage: AssetImage('assets/avatar.png'),
            ),
            const SizedBox(height: 12),
            const Text(
              "Abdullah Mamun",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const Text(
              "@1098-167289",
              style: TextStyle(fontSize: 14, color: Colors.white70),
            ),
            const SizedBox(height: 30),

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
            // const Spacer(),
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
                        title: const Text("Logout"),
                        content: const Text("Are you sure you want to logout?"),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("Cancel"),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUpScreen(),
                                ),
                              );
                              // Add logout logic
                            },
                            child: const Text("Logout"),
                          ),
                        ],
                      ),
                );
              },
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      color: Colors.white,
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            borderRadius: BorderRadius.circular(20.r),
            child: Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: const Color(0xFFF2F2F2),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Icon(
                Icons.arrow_back_ios,
                size: 16.sp,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Text(
            'Profile',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ],
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
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Material(
        color: Colors.black.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        child: ListTile(
          leading: Icon(icon, color: iconColor),
          title: Text(label, style: TextStyle(color: textColor, fontSize: 15)),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: iconColor.withOpacity(0.7),
            size: 16,
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
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(title),
        backgroundColor: const Color.fromARGB(104, 47, 131, 96),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Text(
          "Content for $title goes here.",
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
