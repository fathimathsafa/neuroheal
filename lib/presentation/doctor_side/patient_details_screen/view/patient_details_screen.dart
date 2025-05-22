import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuroheal/core/common/widget/custom_header.dart';
import 'package:neuroheal/core/common/widget/screen_background.dart';

class PatientDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> patient;

  const PatientDetailsScreen({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GradientBackground(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Custom Header like your `Add Records` screen
                Padding(
                  padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                  child: Row(
                    children: [CustomHeader(title: "Patient Details")],
                  ),
                ),
                SizedBox(height: 10.h),

                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // Patient Image
                        CircleAvatar(
                          radius: 50.r,
                          backgroundImage: NetworkImage(
                            patient['image'] ?? 'assets/photo.jpg',
                          ),
                        ),
                        SizedBox(height: 20.h),

                        // Card with patient info
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          elevation: 4,
                          shadowColor: Colors.grey.withOpacity(0.2),
                          child: Padding(
                            padding: EdgeInsets.all(20.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _infoRow("Name", patient['name']),
                                _divider(),
                                _infoRow("Age", patient['age']),
                                _divider(),
                                _infoRow("Gender", patient['gender']),
                                _divider(),
                                _infoRow("Appointment Time", patient['time']),
                                if (patient['email'] != null &&
                                    patient['email'].isNotEmpty) ...[
                                  _divider(),
                                  _infoRow("Email", patient['email']),
                                ],
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 30.h),

                        // Back Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(
                                255,
                                21,
                                165,
                                124,
                              ),
                              padding: EdgeInsets.symmetric(vertical: 14.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Back",
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.white,
                              ),
                            ),
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
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              "$label:",
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
                color: const Color.fromARGB(255, 21, 165, 124),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _divider() => Divider(color: Colors.grey.shade300);
}
