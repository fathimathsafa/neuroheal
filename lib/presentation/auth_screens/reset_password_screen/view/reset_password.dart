// // import 'dart:ui';

// // import 'package:flutter/material.dart';
// // import 'package:flutter/widgets.dart';

// // void showResetPasswordSheet(BuildContext context) {
// //   showModalBottomSheet(
// //     context: context,
// //     isScrollControlled: true,
// //     shape: const RoundedRectangleBorder(
// //       borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
// //     ),
// //     backgroundColor: Colors.white,
// //     builder: (context) {
// //       bool obscureNew = true;
// //       bool obscureRe = true;
// //       return StatefulBuilder(
// //         builder:
// //             (context, setState) => Padding(
// //               padding: const EdgeInsets.all(24.0),
// //               child: Column(
// //                 mainAxisSize: MainAxisSize.min,
// //                 children: [
// //                   Container(
// //                     width: 50,
// //                     height: 4,
// //                     decoration: BoxDecoration(
// //                       color: Colors.grey.shade300,
// //                       borderRadius: BorderRadius.circular(2),
// //                     ),
// //                   ),
// //                   const SizedBox(height: 16),
// //                   const Text(
// //                     "Reset Password",
// //                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// //                   ),
// //                   const SizedBox(height: 8),
// //                   const Text(
// //                     "Set the new password for your account so you can login and access all the features.",
// //                     style: TextStyle(color: Colors.black54),
// //                     textAlign: TextAlign.center,
// //                   ),
// //                   const SizedBox(height: 24),
// //                   TextField(
// //                     obscureText: obscureNew,
// //                     decoration: InputDecoration(
// //                       hintText: "New Password",
// //                       suffixIcon: IconButton(
// //                         icon: Icon(
// //                           obscureNew ? Icons.visibility_off : Icons.visibility,
// //                         ),
// //                         onPressed: () {
// //                           setState(() => obscureNew = !obscureNew);
// //                         },
// //                       ),
// //                       border: OutlineInputBorder(
// //                         borderRadius: BorderRadius.circular(8),
// //                       ),
// //                     ),
// //                   ),
// //                   const SizedBox(height: 16),
// //                   TextField(
// //                     obscureText: obscureRe,
// //                     decoration: InputDecoration(
// //                       hintText: "Re-enter Password",
// //                       suffixIcon: IconButton(
// //                         icon: Icon(
// //                           obscureRe ? Icons.visibility_off : Icons.visibility,
// //                         ),
// //                         onPressed: () {
// //                           setState(() => obscureRe = !obscureRe);
// //                         },
// //                       ),
// //                       border: OutlineInputBorder(
// //                         borderRadius: BorderRadius.circular(8),
// //                       ),
// //                     ),
// //                   ),
// //                   const SizedBox(height: 24),
// //                   SizedBox(
// //                     width: double.infinity,
// //                     height: 50,
// //                     child: ElevatedButton(
// //                       onPressed: () {},
// //                       style: ElevatedButton.styleFrom(
// //                         backgroundColor: const Color(0xFF00C18A),
// //                         shape: RoundedRectangleBorder(
// //                           borderRadius: BorderRadius.circular(8),
// //                         ),
// //                       ),
// //                       child: const Text(
// //                         "Update Password",
// //                         style: TextStyle(fontSize: 16),
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //       );
// //     },
// //   );
// // }


// import 'package:flutter/material.dart';

// class ResetPasswordScreen extends StatefulWidget {
//   const   ResetPasswordScreen({Key? key}) : super(key: key);

//   @override
//   State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
// }

// class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
//   final TextEditingController _newPasswordController = TextEditingController();
//   final TextEditingController _confirmPasswordController = TextEditingController();
//   bool _obscureNewPassword = true;
//   bool _obscureConfirmPassword = true;

//   @override
//   void dispose() {
//     _newPasswordController.dispose();
//     _confirmPasswordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             // Top part with welcome text (same as previous screens)
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'Welcome back',
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   const Text(
//                     'You can continue using your email and find scholarships for abroad studies',
//                     style: TextStyle(
//                       color: Colors.black54,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
            
//             Expanded(child: Container()),
            
//             // Bottom sheet for Reset Password
//             Container(
//               padding: const EdgeInsets.all(24),
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   const Text(
//                     'Reset Password',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 12),
//                   const Text(
//                     'Set the new password for your account so you can login and access all the features.',
//                     style: TextStyle(color: Colors.black54),
//                   ),
//                   const SizedBox(height: 20),
//                   TextField(
//                     controller: _newPasswordController,
//                     decoration: InputDecoration(
//                       labelText: 'New Password',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       suffixIcon: IconButton(
//                         icon: Icon(
//                           _obscureNewPassword ? Icons.visibility_off : Icons.visibility,
//                         ),
//                         onPressed: () {
//                           setState(() {
//                             _obscureNewPassword = !_obscureNewPassword;
//                           });
//                         },
//                       ),
//                     ),
//                     obscureText: _obscureNewPassword,
//                   ),
//                   const SizedBox(height: 16),
//                   TextField(
//                     controller: _confirmPasswordController,
//                     decoration: InputDecoration(
//                       labelText: 'Re-enter Password',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       suffixIcon: IconButton(
//                         icon: Icon(
//                           _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
//                         ),
//                         onPressed: () {
//                           setState(() {
//                             _obscureConfirmPassword = !_obscureConfirmPassword;
//                           });
//                         },
//                       ),
//                     ),
//                     obscureText: _obscureConfirmPassword,
//                   ),
//                   const SizedBox(height: 24),
//                   SizedBox(
//                     width: double.infinity,
//                     height: 50,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         // Add reset password logic here
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(
//                             content: Text('Password updated successfully!'),
//                             backgroundColor: Color(0xFF00C18A),
//                           ),
//                         );
//                         // Navigate back to login or home page
//                         Navigator.popUntil(context, ModalRoute.withName('/forgot_password'));
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color(0xFF00C18A),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       child: const Text(
//                         "Update Password",
//                         style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

class ResetPasswordBottomSheet extends StatefulWidget {
  const ResetPasswordBottomSheet({Key? key}) : super(key: key);

  @override
  State<ResetPasswordBottomSheet> createState() => _ResetPasswordBottomSheetState();
}

class _ResetPasswordBottomSheetState extends State<ResetPasswordBottomSheet> {
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Reset Password",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Set your new password.",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 24),
          TextField(
            obscureText: _obscureNewPassword,
            decoration: InputDecoration(
              hintText: "New Password",
              hintStyle: const TextStyle(color: Colors.grey),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureNewPassword ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _obscureNewPassword = !_obscureNewPassword;
                  });
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 32, 183, 135),
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            ),
            style: const TextStyle(color: Colors.black),
          ),
          const SizedBox(height: 12),
          TextField(
            obscureText: _obscureConfirmPassword,
            decoration: InputDecoration(
              hintText: "Confirm New Password",
              hintStyle: const TextStyle(color: Colors.grey),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _obscureConfirmPassword = !_obscureConfirmPassword;
                  });
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 32, 183, 135),
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            ),
            style: const TextStyle(color: Colors.black),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              // TODO: Implement password reset logic (e.g., API call)

              // After successful reset, you might want to pop all bottom sheets
              // and potentially navigate back to the LoginScreen or show a success message.
              Navigator.pop(context); // Pop ResetPasswordBottomSheet
              // If you want to go back to the login screen and clear any previous navigation stack:
              // Navigator.of(context).pushAndRemoveUntil(
              //   MaterialPageRoute(builder: (context) => const LoginScreen()),
              //   (Route<dynamic> route) => false,
              // );

              // For this example, let's just pop the current sheet and assume the user is back to login or
              // you'd display a success toast/dialog.
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              backgroundColor: const Color.fromARGB(255, 32, 183, 135),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              "Reset Password",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}