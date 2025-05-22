import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuroheal/core/common/widget/custom_header.dart';
import 'package:neuroheal/core/common/widget/screen_background.dart';
import 'package:neuroheal/presentation/doctor_side/orders_medicine_screen/view/orders_medicines_screen.dart';


class EnableLocationScreen extends StatelessWidget {
  const EnableLocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 30.h),
                  Row(
                    children: [
                      const CustomHeader(title: 'Enable Location Services'),
                      // SizedBox(width: 20.w),
                      // Text(
                      //   'Enable Location Services',
                      //   style: TextStyle(
                      //     color: Colors.black,
                      //     fontSize: 18.sp,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                    ],
                  ),
                  SizedBox(height: 80.h),
                  Center(
                    child: Column(
                      children: [
                        Container(
                          width: 100.w,
                          height: 100.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.teal.shade100,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(15.w),
                            child: Image.asset(
                              'assets/location.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(height: 30.h),
                        Text(
                          'Location',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          'Your location services are switched off. Please enable location to help us serve better.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        SizedBox(height: 40.h),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) =>
                                          const MedicinesOrdersScreen(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal,
                              padding: EdgeInsets.symmetric(
                                vertical: 16.h,
                              ), // Responsive vertical padding
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  12.r,
                                ), // Responsive border radius
                              ),
                              elevation: 4,
                            ),
                            child: Text(
                              'Enable Location',
                              style: TextStyle(
                                fontSize: 16.sp, // Responsive font size
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 30.h),
                      ],
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
