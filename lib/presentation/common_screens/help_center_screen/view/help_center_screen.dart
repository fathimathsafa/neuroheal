import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuroheal/core/common/widget/custom_header.dart';
import 'package:neuroheal/core/common/widget/screen_background.dart';


class HelpCenterScreen extends StatelessWidget {
  final List<String> helpTopics = [
    'Booking a new Appointment',
    'Existing Appointment',
    'Online consultations',
    'Feedbacks',
    'Medicine orders',
    'Diagnostic Tests',
    'Health plans',
    'My account and Practo Drive',
    'Have a feature in mind',
    'Other issues',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.w), // Use ScreenUtil for padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const CustomHeader(title: "Help center"),
              SizedBox(height: 12.h),

              // Issue text container with responsive padding & radius
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: Colors.teal.shade100.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  'I have an issue with',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 0, 150, 95),
                    fontSize: 16.sp, // Responsive font size
                  ),
                ),
              ),

              SizedBox(height: 16.h),

              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: helpTopics.length,
                separatorBuilder: (context, index) => Divider(height: 1),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      debugPrint('Selected: ${helpTopics[index]}');
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            helpTopics[index],
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: const Color.fromARGB(
                                255,
                                104,
                                102,
                                102,
                              ), // <- here you add grey color
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: const Color.fromARGB(255, 104, 102, 102),
                            size: 18.sp,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),

              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
