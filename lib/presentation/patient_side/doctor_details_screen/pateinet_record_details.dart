import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuroheal/core/common/widget/custom_header.dart';
import 'package:neuroheal/core/common/widget/screen_background.dart';


class PatientRecordScreen extends StatelessWidget {
  final Map<String, dynamic> patient;

  const PatientRecordScreen({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GradientBackground(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Custom header
                Padding(
                  padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                  child: Row(children: [CustomHeader(title: "Patient Record")]),
                ),

                Expanded(
                  child: SingleChildScrollView(
                    child: Card(
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
                            _infoText("Name", patient['name']),
                            _divider(),
                            _infoText("Age", patient['age']),
                            _divider(),
                            _infoText("Gender", patient['gender']),
                            _divider(),
                            if (patient['email'] != null &&
                                patient['email'].isNotEmpty)
                              _infoText("Email", patient['email']),
                            SizedBox(height: 30.h),

                            // View Button
                            Center(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(
                                    255,
                                    21,
                                    165,
                                    124,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 40.w,
                                    vertical: 14.h,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (_) => PrescriptionViewScreen(
                                            imageUrl:
                                                patient['prescriptionImage'] ??
                                                'assets/priscription.jpeg',
                                          ),
                                    ),
                                  );
                                },
                                child: Text(
                                  "View Prescription",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _infoText(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: RichText(
        text: TextSpan(
          style: TextStyle(fontSize: 15.sp, color: Colors.black),
          children: [
            TextSpan(
              text: "$label: ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 21, 165, 124),
              ),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }

  Widget _divider() => Divider(color: Colors.grey.shade300);
}

class PrescriptionViewScreen extends StatelessWidget {
  final String imageUrl;

  const PrescriptionViewScreen({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GradientBackground(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Custom header
                Padding(
                  padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                  child: Row(children: [CustomHeader(title: "Prescription")]),
                ),

                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.contain,
                      width: double.infinity,
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(
                          child: Text("Failed to load image"),
                        );
                      },
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
}
