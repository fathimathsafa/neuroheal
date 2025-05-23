// import 'package:flutter/material.dart';
// import 'package:neuroheal/core/constants/app_colors.dart';
// import 'package:neuroheal/presentation/auth_screens/registration_screen/view/registration_screen.dart';
// import 'package:neuroheal/presentation/common_screens/help_center_screen/view/help_center_screen.dart';
// import 'package:neuroheal/presentation/doctor_side/all_record_screen/view/all_record_screen.dart';
// import 'package:neuroheal/presentation/doctor_side/medicine_order_screen/view/medicine_order_screen.dart';
// import 'package:neuroheal/presentation/doctor_side/my_pateient_screen/view/my_patient_screen.dart';

// class SideMenu extends StatelessWidget {
//   const SideMenu({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: Container(
//         color: AppColors.primaryColor, // Purple-gray color as shown in image
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             // Header with profile info and close button
//             SizedBox(
//               height: MediaQuery.of(context).padding.top + 120,
//               child: DrawerHeader(
//                 margin: EdgeInsets.zero,
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 16,
//                   vertical: 8,
//                 ),
//                 decoration: const BoxDecoration(
//                   // Same color as the drawer, no separate background
//                   color: AppColors.primaryColor,
//                 ),
//                 child: Stack(
//                   children: [
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         // Profile image
//                         const CircleAvatar(
//                           radius: 24,
//                           backgroundImage: AssetImage('assets/avatar.png'),
//                         ),
//                         const SizedBox(width: 12),
//                         // User information
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: const [
//                             Text(
//                               "Abdullah Mamun",
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                             Text(
//                               "@1098-167289",
//                               style: TextStyle(
//                                 color: Colors.white70,
//                                 fontSize: 13,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     // Close button
//                     Positioned(
//                       top: 0,
//                       right: 0,
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: Colors.red,
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: IconButton(
//                           iconSize: 20,
//                           padding: EdgeInsets.zero,
//                           constraints: const BoxConstraints(
//                             minWidth: 34,
//                             minHeight: 34,
//                           ),
//                           icon: const Icon(Icons.close, color: Colors.white),
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             // Menu Items with their original navigation
//             _buildDrawerItem(
//               context,
//               icon: Icons.person,
//               text: "My Patients",
//               onTap: () {
//                 Navigator.pop(context);
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => MyPatientsScreen()),
//                 );
//               },
//             ),
//             _buildDrawerItem(
//               context,
//               icon: Icons.receipt_long,
//               text: "Medical Records",
//               onTap: () {
//                 Navigator.pop(context);
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => AllRecordsScreen()),
//                 );
//               },
//             ),
//             _buildDrawerItem(
//               context,
//               icon: Icons.payment,
//               text: "Payments",
//               onTap: () {
//                 Navigator.pop(context);
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder:
//                         (context) => const PlaceholderScreen(title: "Payments"),
//                   ),
//                 );
//               },
//             ),
//             _buildDrawerItem(
//               context,
//               icon: Icons.local_pharmacy,
//               text: "Medicine Orders",
//               onTap: () {
//                 Navigator.pop(context);
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => MedicineOrdersScreen(),
//                   ),
//                 );
//               },
//             ),
//             _buildDrawerItem(
//               context,
//               icon: Icons.event_note,
//               text: "Test Bookings",
//               onTap: () {
//                 Navigator.pop(context);
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder:
//                         (context) =>
//                             const PlaceholderScreen(title: "Test Bookings"),
//                   ),
//                 );
//               },
//             ),
//             _buildDrawerItem(
//               context,
//               icon: Icons.privacy_tip,
//               text: "Privacy & Policy",
//               onTap: () {
//                 Navigator.pop(context);
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder:
//                         (context) =>
//                             const PlaceholderScreen(title: "Privacy & Policy"),
//                   ),
//                 );
//               },
//             ),
//             _buildDrawerItem(
//               context,
//               icon: Icons.help,
//               text: "Help Center",
//               onTap: () {
//                 Navigator.pop(context);
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => HelpCenterScreen()),
//                 );
//               },
//             ),
//             _buildDrawerItem(
//               context,
//               icon: Icons.settings,
//               text: "Settings",
//               onTap: () {
//                 Navigator.pop(context);
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder:
//                         (context) => const PlaceholderScreen(title: "Settings"),
//                   ),
//                 );
//               },
//             ),

//             const SizedBox(height: 20),
//             // Logout button with updated styling but keeping same functionality
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: ListTile(
//                 contentPadding: const EdgeInsets.symmetric(horizontal: 8),
//                 leading: const Icon(Icons.logout, color: Colors.white),
//                 title: const Text(
//                   "Logout",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//                 onTap: () {
//                   Navigator.pop(context); // Close drawer
//                   // Keep your original logout logic
//                   showDialog(
//                     context: context,
//                     builder:
//                         (context) => AlertDialog(
//                           title: const Text("Logout"),
//                           content: const Text(
//                             "Are you sure you want to logout?",
//                           ),
//                           actions: [
//                             TextButton(
//                               onPressed: () => Navigator.pop(context),
//                               child: const Text("Cancel"),
//                             ),
//                             TextButton(
//                               onPressed: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => SignUpScreen(),
//                                   ),
//                                 );
//                               },
//                               child: const Text("Logout"),
//                             ),
//                           ],
//                         ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Updated helper method to build drawer items with proper styling
//   Widget _buildDrawerItem(
//     BuildContext context, {
//     required IconData icon,
//     required String text,
//     required VoidCallback onTap,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: ListTile(
//         contentPadding: const EdgeInsets.symmetric(horizontal: 8),
//         leading: Icon(icon, color: Colors.white),
//         title: Text(
//           text,
//           style: const TextStyle(color: Colors.white, fontSize: 14),
//         ),
//         trailing: const Icon(
//           Icons.arrow_forward_ios,
//           color: Colors.white70,
//           size: 14,
//         ),
//         onTap: onTap,
//       ),
//     );
//   }
// }

// // Keep your original PlaceholderScreen
// class PlaceholderScreen extends StatelessWidget {
//   final String title;
//   const PlaceholderScreen({Key? key, required this.title}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title),
//         backgroundColor: const Color(0xFF2F4C83), // Match drawer color
//         foregroundColor: Colors.white,
//       ),
//       body: Center(
//         child: Text(
//           "Content for $title goes here.",
//           style: const TextStyle(fontSize: 18),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:neuroheal/core/constants/app_colors.dart';
import 'package:neuroheal/presentation/auth_screens/controller/auth_controller.dart';
import 'package:neuroheal/presentation/auth_screens/login_screen/view/login_screen.dart';
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
                        Consumer<AuthProvider>(
                          builder: (context, authProvider, child) {
                            final user = authProvider.user;
                            return CircleAvatar(
                              radius: 24,
                              backgroundImage:
                                  user?.photoURL != null
                                      ? NetworkImage(user!.photoURL!)
                                      : const AssetImage('assets/avatar.png')
                                          as ImageProvider,
                            );
                          },
                        ),
                        const SizedBox(width: 12),
                        // User information
                        Expanded(
                          child: Consumer<AuthProvider>(
                            builder: (context, authProvider, child) {
                              final user = authProvider.user;
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    user?.displayName ?? "User Name",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    user?.email ?? "@user-email",
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 13,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              );
                            },
                          ),
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
            // _buildDrawerItem(
            //   context,
            //   icon: Icons.receipt_long,
            //   text: "Medical Records",
            //   onTap: () {
            //     Navigator.pop(context);
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => AllRecordsScreen()),
            //     );
            //   },
            // ),
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

            // Updated Logout button with proper SharedPreferences integration
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
                  _showLogoutDialog(context);
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

  // Logout dialog with proper authentication handling
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (BuildContext dialogContext) => AlertDialog(
            title: const Text(
              "Logout",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
            content: const Text(
              "Are you sure you want to logout?",
              style: TextStyle(fontSize: 16),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(dialogContext),
                child: const Text(
                  "Cancel",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
              Consumer<AuthProvider>(
                builder: (context, authProvider, child) {
                  return TextButton(
                    onPressed:
                        authProvider.isLoading
                            ? null
                            : () => _handleLogout(dialogContext, authProvider),
                    child:
                        authProvider.isLoading
                            ? const SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.red,
                              ),
                            )
                            : const Text(
                              "Logout",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                  );
                },
              ),
            ],
          ),
    );
  }

  // Handle logout with proper error handling and navigation
  Future<void> _handleLogout(
    BuildContext context,
    AuthProvider authProvider,
  ) async {
    try {
      // Perform logout (this will clear Firebase auth and SharedPreferences)
      final success = await authProvider.signOut();

      if (success) {
        // Close the dialog
        Navigator.pop(context);

        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Logged out successfully"),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ),
        );

        // Navigate to login screen and clear all previous routes
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
          (route) => false, // This removes all previous routes
        );
      } else {
        // Close the dialog
        Navigator.pop(context);

        // Show error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(authProvider.errorMessage ?? "Logout failed"),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      // Close the dialog
      Navigator.pop(context);

      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("An unexpected error occurred during logout"),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
    }
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
