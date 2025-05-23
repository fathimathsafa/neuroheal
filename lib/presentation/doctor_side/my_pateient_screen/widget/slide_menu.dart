import 'package:flutter/material.dart';
import 'package:neuroheal/core/constants/app_colors.dart';
import 'package:neuroheal/presentation/auth_screens/registration_screen/view/registration_screen.dart';
import 'package:neuroheal/presentation/common_screens/help_center_screen/view/help_center_screen.dart';
import 'package:neuroheal/presentation/doctor_side/all_record_screen/view/all_record_screen.dart';
import 'package:neuroheal/presentation/doctor_side/medicine_order_screen/view/medicine_order_screen.dart';
import 'package:neuroheal/presentation/doctor_side/my_pateient_screen/view/my_patient_screen.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: AppColors.primaryColor, // Purple-gray color as shown in image
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Header with profile info and close button
            SizedBox(
              height: MediaQuery.of(context).padding.top + 120,
              child: DrawerHeader(
                margin: EdgeInsets.zero,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: const BoxDecoration(
                  // Same color as the drawer, no separate background
                  color: AppColors.primaryColor,
                ),
                child: Stack(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Profile image
                        const CircleAvatar(
                          radius: 24,
                          backgroundImage: AssetImage('assets/avatar.png'),
                        ),
                        const SizedBox(width: 12),
                        // User information
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Abdullah Mamun",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "@1098-167289",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // Close button
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: IconButton(
                          iconSize: 20,
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(
                            minWidth: 34,
                            minHeight: 34,
                          ),
                          icon: const Icon(Icons.close, color: Colors.white),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Menu Items with their original navigation
            _buildDrawerItem(
              context,
              icon: Icons.person,
              text: "My Patients",
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyPatientsScreen()),
                );
              },
            ),
            _buildDrawerItem(
              context,
              icon: Icons.receipt_long,
              text: "Medical Records",
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AllRecordsScreen()),
                );
              },
            ),
            _buildDrawerItem(
              context,
              icon: Icons.payment,
              text: "Payments",
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => const PlaceholderScreen(title: "Payments"),
                  ),
                );
              },
            ),
            _buildDrawerItem(
              context,
              icon: Icons.local_pharmacy,
              text: "Medicine Orders",
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MedicineOrdersScreen(),
                  ),
                );
              },
            ),
            _buildDrawerItem(
              context,
              icon: Icons.event_note,
              text: "Test Bookings",
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) =>
                            const PlaceholderScreen(title: "Test Bookings"),
                  ),
                );
              },
            ),
            _buildDrawerItem(
              context,
              icon: Icons.privacy_tip,
              text: "Privacy & Policy",
              onTap: () {
                Navigator.pop(context);
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
            _buildDrawerItem(
              context,
              icon: Icons.help,
              text: "Help Center",
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HelpCenterScreen()),
                );
              },
            ),
            _buildDrawerItem(
              context,
              icon: Icons.settings,
              text: "Settings",
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => const PlaceholderScreen(title: "Settings"),
                  ),
                );
              },
            ),

            const SizedBox(height: 20),
            // Logout button with updated styling but keeping same functionality
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                leading: const Icon(Icons.logout, color: Colors.white),
                title: const Text(
                  "Logout",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context); // Close drawer
                  // Keep your original logout logic
                  showDialog(
                    context: context,
                    builder:
                        (context) => AlertDialog(
                          title: const Text("Logout"),
                          content: const Text(
                            "Are you sure you want to logout?",
                          ),
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
                              },
                              child: const Text("Logout"),
                            ),
                          ],
                        ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Updated helper method to build drawer items with proper styling
  Widget _buildDrawerItem(
    BuildContext context, {
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
        leading: Icon(icon, color: Colors.white),
        title: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.white70,
          size: 14,
        ),
        onTap: onTap,
      ),
    );
  }
}

// Keep your original PlaceholderScreen
class PlaceholderScreen extends StatelessWidget {
  final String title;
  const PlaceholderScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: const Color(0xFF2F4C83), // Match drawer color
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
