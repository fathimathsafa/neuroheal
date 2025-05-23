import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neuroheal/core/constants/app_colors.dart';
import 'package:neuroheal/core/common/widget/screen_background.dart';
import 'package:neuroheal/presentation/patient_side/appoinment_calender_screen/view/appoinment_calender_screen.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({Key? key}) : super(key: key);

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  int _selectedPatient = -1; // -1 means no selection

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F8FF),

      body: GradientBackground(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with back button and title
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: Row(
                children: [
                  Flexible(
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios_new, size: 20.sp),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  SizedBox(width: 24.w),
                  Flexible(
                    child: Text(
                      'Appointment',
                      style: GoogleFonts.poppins(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                padding: EdgeInsets.all(16.r),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Doctor info
                    Row(
                      children: [
                        // Doctor image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.r),
                          child: Container(
                            width: 80.w,
                            height: 80.w,
                            color: const Color(0xFFE6F3F8),
                            child: Image.network(
                              'https://cdn-icons-png.flaticon.com/512/3774/3774299.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 16.w),

                        // Doctor info
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Dr. Pediatrician',
                                    style: GoogleFonts.poppins(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  // Icon(
                                  //   Icons.favorite,
                                  //   color: Colors.red,
                                  //   size: 22.sp,
                                  // ),
                                ],
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                'consultance psychologist',
                                style: GoogleFonts.poppins(
                                  fontSize: 14.sp,
                                  color: Colors.grey[600],
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Row(
                                children: [
                                  // Star rating
                                  Row(
                                    children: List.generate(
                                      5,
                                      (index) => Icon(
                                        index < 4
                                            ? Icons.star
                                            : Icons.star_border,
                                        color: Colors.amber,
                                        size: 18.sp,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  // Price
                                  Text(
                                    '\$28.00/hr',
                                    style: GoogleFonts.poppins(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 24.h),

                    // Appointment For section
                    Text(
                      'Appointment For',
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        color: AppColors.textLightDark,
                      ),
                    ),

                    SizedBox(height: 12.h),

                    // Patient Name input
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Patient Name',
                        hintStyle: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 14.sp,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 14.h,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(color: Colors.grey[400]!),
                        ),
                      ),
                    ),

                    SizedBox(height: 16.h),

                    // Contact Number input
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Contact Number',
                        hintStyle: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 14.sp,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 14.h,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(color: Colors.grey[400]!),
                        ),
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                    SizedBox(height: 16.h),

                    // Contact Number input
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Age',
                        hintStyle: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 14.sp,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 14.h,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(color: Colors.grey[400]!),
                        ),
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                    SizedBox(height: 16.h),

                    // Contact Number input
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Relation with Patient',
                        hintStyle: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 14.sp,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 14.h,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(color: Colors.grey[400]!),
                        ),
                      ),
                      keyboardType: TextInputType.phone,
                    ),

                    //   SizedBox(height: 24.h),
                    Spacer(),

                    // Next button
                    SizedBox(
                      width: double.infinity,
                      height: 50.h,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AppointmentCalendarScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2ECC71),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                        child: Text(
                          'Next',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}
