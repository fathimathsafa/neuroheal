import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorScreen extends StatelessWidget {
  const DoctorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: const Color(0xFFF5F7FA),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Search bar
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 12.h,
                          ),
                          color: Colors.white,
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_back_ios,
                                size: 20.sp,
                                color: Colors.black54,
                              ),
                              Spacer(),
                              Icon(
                                Icons.search,
                                size: 22.sp,
                                color: Colors.black54,
                              ),
                            ],
                          ),
                        ),

                        // Popular Doctor Section
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 12.h,
                          ),
                          color: const Color(0xFFEBF6FF),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Popular Doctor",
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  Text(
                                    "See all >",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Colors.black45,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16.h),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                child: Row(
                                  children: [
                                    _popularDoctorCard(
                                      "Dr. Truluck Nik",
                                      "Medicine Specialist",
                                      "assets/doctor1.jpg",
                                      4,
                                    ),
                                    SizedBox(width: 12.w),
                                    _popularDoctorCard(
                                      "Dr. Tranquilli",
                                      "Pathology Specialist",
                                      "assets/doctor2.jpg",
                                      4,
                                    ),
                                    SizedBox(width: 12.w),
                                    _popularDoctorCard(
                                      "Dr. Tru",
                                      "Medicine Specialist",
                                      "assets/doctor3.jpg",
                                      4,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Category
                        Container(
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 16.h,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Category",
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                              SizedBox(height: 16.h),
                              _doctorListItem(
                                "Dr. Pediatrician",
                                "Specialist Cardiologist",
                                "assets/doctor_female.jpg",
                                4,
                                "2.4",
                                "(2475 views)",
                                true,
                              ),
                              SizedBox(height: 16.h),
                              _doctorListItem(
                                "Dr. Mistry Brick",
                                "Specialist Dentist",
                                "assets/doctor_male.jpg",
                                4,
                                "2.8",
                                "(2893 views)",
                                false,
                              ),
                              SizedBox(height: 16.h),
                              _doctorListItem(
                                "Dr. Ether Wall",
                                "Specialist Cancer",
                                "assets/doctor_female2.jpg",
                                4,
                                "2.7",
                                "(2754 views)",
                                true,
                              ),
                              SizedBox(height: 16.h),
                              _doctorListItem(
                                "Dr. Johan smith",
                                "Specialist cardiologist",
                                "assets/doctor_male2.jpg",
                                4,
                                "",
                                "",
                                false,
                              ),
                            ],
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
    );
  }

  Widget _popularDoctorCard(
    String name,
    String specialty,
    String image,
    int rating,
  ) {
    return Container(
      width: 120.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.r),
              topRight: Radius.circular(8.r),
            ),
            child: Container(
              height: 100.h,
              width: double.infinity,
              color: Colors.grey.shade300,
              child: Center(
                child: Icon(Icons.person, size: 40.sp, color: Colors.grey),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  specialty,
                  style: TextStyle(fontSize: 12.sp, color: Colors.black54),
                ),
                SizedBox(height: 4.h),
                Row(
                  children: List.generate(
                    5,
                    (index) => Icon(
                      index < rating ? Icons.star : Icons.star_border,
                      size: 16.sp,
                      color: Colors.amber,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _doctorListItem(
    String name,
    String specialty,
    String image,
    int rating,
    String score,
    String views,
    bool isFavorite,
  ) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 70.w,
            height: 70.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: Colors.grey.shade300,
            ),
            child: Center(
              child: Icon(Icons.person, size: 40.sp, color: Colors.grey),
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
                      name,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : Colors.grey,
                      size: 24.sp,
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Text(
                  specialty,
                  style: TextStyle(fontSize: 14.sp, color: Colors.black54),
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Row(
                      children: List.generate(
                        5,
                        (index) => Icon(
                          index < rating ? Icons.star : Icons.star_border,
                          size: 16.sp,
                          color: Colors.amber,
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    if (score.isNotEmpty)
                      Text(
                        score,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    SizedBox(width: 4.w),
                    if (views.isNotEmpty)
                      Text(
                        views,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black54,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
