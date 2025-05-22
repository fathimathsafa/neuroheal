import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:neuroheal/core/constants/app_colors.dart';
import 'package:neuroheal/core/common/widget/screen_background.dart';
import 'package:neuroheal/presentation/patient_side/doctor_appoinment_screen/view/doctor_appoinment_screen.dart';

class DoctorDetailsScreen extends StatefulWidget {
  const DoctorDetailsScreen({Key? key}) : super(key: key);

  @override
  State<DoctorDetailsScreen> createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {
  late GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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

              SizedBox(height: 16.h),

              // Doctor card
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  padding: EdgeInsets.all(12.r),
                  child: Row(
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Dr. Pediatrician',
                                  style: TextStyle(
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
                              'Specialist Cardiologist',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.grey[600],
                              ),
                            ),
                            Text(
                              '7 Years Experience',
                              style: TextStyle(
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
                                  style: TextStyle(
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
                ),
              ),

              SizedBox(height: 16.h),

              // Book Now button
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AppointmentScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2ECC71),
                    minimumSize: Size(double.infinity, 48.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  child: Text(
                    'Book Now',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 24.h),

              // Stats row
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatColumn('100', 'Runnig'),
                    Container(height: 36.h, width: 1, color: Colors.grey[300]),
                    _buildStatColumn('500', 'Ongoing'),
                    Container(height: 36.h, width: 1, color: Colors.grey[300]),
                    _buildStatColumn('700', 'Patient'),
                  ],
                ),
              ),

              SizedBox(height: 24.h),

              // Services section
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text(
                  'Services',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(height: 12.h),

              // Service list
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    _buildServiceItem(
                      1,
                      'Patient care should be the number one priority.',
                    ),
                    SizedBox(height: 10.h),
                    _buildServiceItem(
                      2,
                      'If you run your practiceyou know how frustrating.',
                    ),
                    SizedBox(height: 10.h),
                    _buildServiceItem(
                      3,
                      'That\'s why some of appointment reminder system.',
                    ),
                  ],
                ),
              ),

              SizedBox(height: 16.h),

              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatColumn(String count, String label) {
    return Column(
      children: [
        Text(
          count,
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            color: label == 'Patient' ? Colors.blue : Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildServiceItem(int number, String text) {
    Color getNumberColor(int n) {
      switch (n) {
        case 1:
          return AppColors.primaryColor;
        case 2:
          return AppColors.primaryColor;
        case 3:
          return AppColors.primaryColor;
        default:
          return AppColors.primaryColor;
      }
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$number.',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: getNumberColor(number),
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontSize: 14.sp, color: Colors.grey[700]),
          ),
        ),
      ],
    );
  }
}
