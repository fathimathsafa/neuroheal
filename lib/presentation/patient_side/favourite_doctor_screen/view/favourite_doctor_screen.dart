import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuroheal/presentation/patient_side/doctor_details_screen/view/doctor_details_screen.dart';

class FavouriteDoctorsScreen extends StatelessWidget {
  const FavouriteDoctorsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              alignment: Alignment.centerLeft,
              child: Text(
                'Favourite Doctors',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ),

            // Body scrollable
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Search Bar
                      Container(
                        height: 50.h,
                        margin: EdgeInsets.symmetric(vertical: 16.h),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Dentist',
                            hintStyle: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.grey,
                            ),
                            prefixIcon: Icon(
                              Icons.search,
                              size: 22.sp,
                              color: Colors.grey,
                            ),
                            suffixIcon: Icon(
                              Icons.close,
                              size: 22.sp,
                              color: Colors.grey,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 15.h,
                            ),
                          ),
                        ),
                      ),

                      // Favourite Doctors Grid
                      GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        childAspectRatio: 0.85,
                        crossAxisSpacing: 16.w,
                        mainAxisSpacing: 16.h,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DoctorDetailsScreen(),
                                ),
                              );
                            },
                            child: _doctorGridItem(
                              "Dr. Shouey",
                              "Specialist Cardiology",
                              Colors.green,
                              false,
                            ),
                          ),
                          _doctorGridItem(
                            "Dr. Christenfeld N",
                            "Specialist Cancer",
                            Colors.green,
                            true,
                          ),
                          _doctorGridItem(
                            "Dr. Shouey",
                            "Specialist Medicine",
                            Colors.green,
                            true,
                          ),
                          _doctorGridItem(
                            "Dr. Shouey",
                            "Specialist Dentist",
                            Colors.green,
                            false,
                          ),
                        ],
                      ),

                      // Feature Doctor Section
                      Padding(
                        padding: EdgeInsets.only(top: 24.h, bottom: 16.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Feature Doctor",
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
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Feature Doctor List
                      SizedBox(
                        height: 130.h,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            _featureDoctorItem("Dr. Crick", "3.7", false),
                            _featureDoctorItem("Dr. Strain", "3.0", true),
                            _featureDoctorItem("Dr. Lachinet", "2.9", false),
                            _featureDoctorItem("D", "", true),
                          ],
                        ),
                      ),

                      SizedBox(height: 80.h),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _doctorGridItem(
    String name,
    String specialty,
    Color specialtyColor,
    bool isFavorite,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.r),
                      topRight: Radius.circular(12.r),
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.person_rounded,
                      size: 60.sp,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
                Positioned(
                  top: 8.h,
                  right: 8.w,
                  child: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.grey.shade300,
                    size: 24.sp,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    specialty,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: specialtyColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _featureDoctorItem(String name, String rating, bool isFavorite) {
    return Container(
      width: 100.w,
      margin: EdgeInsets.only(right: 16.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.favorite_border, size: 18.sp, color: Colors.grey),
              SizedBox(width: 4.w),
              if (rating.isNotEmpty)
                Row(
                  children: [
                    Icon(Icons.star, size: 18.sp, color: Colors.amber),
                    SizedBox(width: 2.w),
                    Text(
                      rating,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              SizedBox(width: 4.w),
              Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                size: 18.sp,
                color: isFavorite ? Colors.red : Colors.grey,
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Expanded(
            child: Container(
              width: 70.w,
              height: 70.w,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Expanded(
                  child: Icon(
                    Icons.person_rounded,
                    size: 40.sp,
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Expanded(
            child: Text(
              name,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Text(
              "\$20.00/hour",
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.green,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
