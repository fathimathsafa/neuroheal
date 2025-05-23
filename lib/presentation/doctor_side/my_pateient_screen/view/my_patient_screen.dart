import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neuroheal/core/common/widget/screen_background.dart';
import 'package:neuroheal/core/constants/app_colors.dart';
import 'package:neuroheal/presentation/doctor_side/my_pateient_screen/widget/slide_menu.dart';
import 'package:neuroheal/presentation/doctor_side/patient_details_screen/view/patient_details_screen.dart';

class MyPatientsScreen extends StatelessWidget {
  const MyPatientsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> doctors = [
      {
        'name': 'Shruti Kedia',
        'age': '25',
        'gender': 'Male',
        'rating': '97%',
        'stories': '69 Patient Stories',
        'time': '10:00 AM tomorrow',
        'image': 'assets/live_chat/live_chat.jpg',
        'favorite': true,
      },
      {
        'name': 'Watamaniuk',
        'age': '20',
        'gender': 'Female',
        'rating': '74%',
        'stories': '78 Patient Stories',
        'time': '12:00 AM tomorrow',
        'image': 'assets/live_chat/live_chat.jpg',
        'favorite': false,
      },
      {
        'name': 'Crownover',
        'age': '25',
        'gender': 'Male',
        'rating': '59%',
        'stories': '86 Patient Stories',
        'time': '11:00 AM tomorrow',
        'image': 'assets/live_chat/live_chat.jpg0',
        'favorite': true,
      },
      {
        'name': 'Balestra',
        'age': '35',
        'gender': 'Female',
        'rating': '',
        'stories': '',
        'time': '',
        'image': 'assets/live_chat/live_chat.jpg',
        'favorite': false,
      },
    ];

    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      drawer: const SideMenu(),
      body: GradientBackground(
        child: Padding(
          padding: EdgeInsets.all(12.w),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.menu, size: 24.sp),
                    onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                  ),
                  SizedBox(width: 10.w),
                  SizedBox(width: 20.w),
                  Flexible(
                    child: Text(
                      "My Patients",
                      style: GoogleFonts.poppins(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDarkColor,
                      ),
                    ),
                  ),
                ],
              ),

              // Search bar
              Container(
                margin: EdgeInsets.only(bottom: 16.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 4.r,
                      offset: Offset(0, 2.h),
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'patients',
                    hintStyle: GoogleFonts.poppins(
                      color: Colors.grey,
                      fontSize: 16.sp,
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                      size: 20.sp,
                    ),
                    //suffixIcon: Icon(Icons.close, color: Colors.grey, size: 20.sp),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 15.h),
                  ),
                ),
              ),

              // List of patients
              Expanded(
                child: ListView.builder(
                  itemCount: doctors.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: _buildDoctorCard(context, doctors[index]),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDoctorCard(BuildContext context, Map<String, dynamic> patient) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 70.w,
                  height: 70.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    image: DecorationImage(
                      image: AssetImage(patient['image']),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            patient['name'],
                            style: GoogleFonts.poppins(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          // Icon(
                          //   patient['favorite']
                          //       ? Icons.favorite
                          //       : Icons.favorite_border,
                          //   color:
                          //       patient['favorite'] ? Colors.red : Colors.grey,
                          //   size: 24.sp,
                          // ),
                        ],
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        "Gender: ${patient['gender']}",
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          color: Color(0xFF1ED19D),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        "Age: ${patient['age']}",
                        style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: 8.h),
                      // if (patient['rating'].isNotEmpty)
                      //   Row(
                      //     children: [
                      //       _buildRatingItem(patient['rating'], Colors.green),
                      //       SizedBox(width: 12.w),
                      //       _buildRatingItem(patient['stories'], Colors.green),
                      //     ],
                      //   ),
                    ],
                  ),
                ),
              ],
            ),
            if (patient['time'].isNotEmpty)
              Column(
                children: [
                  SizedBox(height: 16.h),
                  Divider(height: 1.h, color: Colors.grey[200]),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Appoinment time',
                            style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF1ED19D),
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            patient['time'],
                            style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) =>
                                      PatientDetailsScreen(patient: patient),
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 21, 165, 124),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Text(
                            'View Now',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingItem(String text, Color color) {
    return Row(
      children: [
        Container(
          width: 10.w,
          height: 10.h,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        SizedBox(width: 4.w),
        Text(
          text,
          style: GoogleFonts.poppins(fontSize: 12.sp, color: Colors.grey[600]),
        ),
      ],
    );
  }
}
