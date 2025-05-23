import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neuroheal/core/constants/app_colors.dart';
import 'package:neuroheal/core/constants/app_text_styles.dart';
import 'package:neuroheal/presentation/patient_side/doctor_profile_screen/view/doctor_profile_screen.dart';
import 'package:neuroheal/presentation/patient_side/live_chat_screen/view/live_chat_screen.dart';

class Doctor {
  final String name;
  final String specialty;
  final String image;
  final int rating;

  Doctor({
    required this.name,
    required this.specialty,
    required this.image,
    required this.rating,
  });
}

final List<Doctor> doctors = [
  Doctor(
    name: "Dr. Alice",
    specialty: "Counsiling psychologist",
    image: "assets/live_chat/comment4.jpg",
    rating: 4,
  ),
  Doctor(
    name: "Dr. Bob",
    specialty: "child psychologiest",
    image: "assets/live_chat/comment4.jpg",
    rating: 5,
  ),
  Doctor(
    name: "Dr. Carol",
    specialty: "clinical psychologiest",
    image: "assets/live_chat/comment4.jpg",
    rating: 3,
  ),
];

class DoctorHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildHeader(context),

          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 24.h),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DoctorLiveChatScreen(),
                          ),
                        );
                      },
                      child: _buildLiveDoctorsSection(),
                    ),
                    SizedBox(height: 24.h),
                    // _buildCategoryIcons(),
                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      height: 120.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: const Color(0xFF1ED19D),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left: Greeting text
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Hi Handwerker!', style: AppTextStyles.subHeadding),
              SizedBox(height: 4.h),

              // Expanded(
              //   child: Text(
              //     'Find Your Doctor',
              //     style: AppTextStyles.appBarHeadding2,
              //   ),
              // ),

              Expanded(
                child: Text(
                  'Find Your Doctor',
                  style: AppTextStyles.appBarHeadding2,
                ),
              ),
            ],
          ),

          // Right: Profile picture with InkWell
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => DoctorProfileScreen()),
              );
            },
            borderRadius: BorderRadius.circular(50.r),
            child: CircleAvatar(
              radius: 22.r,
              backgroundImage: AssetImage('assets/live_chat/comment3.jpg'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLiveDoctorsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Live Doctors',
          style: GoogleFonts.poppins(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 16.h),
        SizedBox(
          height: 180.h,

          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildLiveDoctorCard('assets/live_chat/comment4.jpg'),
              SizedBox(width: 12.w),
              _buildLiveDoctorCard('assets/live_chat/comment2.jpg'),
              SizedBox(width: 12.w),
              _buildLiveDoctorCard('assets/live_chat/comment1.jpg'),
              SizedBox(width: 12.w),
              _buildLiveDoctorCard('assets/live_chat/live_chat.jpg'),
            ],
          ),
        ),

        SizedBox(height: 16.h),

        Text(
          "Popular Doctors",
          style: GoogleFonts.poppins(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 16.h),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: doctors.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            crossAxisSpacing: 12.w,
            mainAxisSpacing: 12.h,
            childAspectRatio:
                3 / 2, // width to height ratio; adjust to prevent overflow
          ),
          itemBuilder: (context, index) {
            final doc = doctors[index];
            return _popularDoctorCard(
              doc.name,
              doc.specialty,
              doc.image,
              doc.rating,
            );
          },
        ),
      ],
    );
  }

  Widget _buildLiveDoctorCard(String imagePath) {
    return Stack(
      children: [
        Container(
          width: 120.w,
          height: 180.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: Colors.grey.shade200,
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),

        // Live Badge
        Positioned(
          top: 10.h,
          left: 10.w,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: Row(
              children: [
                Icon(Icons.circle, color: Colors.white, size: 8.sp),
                SizedBox(width: 4.w),
                Text(
                  'LIVE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),

        // Pause Icon in Center
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(8.w),
              child: Icon(Icons.play_arrow, color: Colors.white, size: 36.sp),
            ),
          ),
        ),
      ],
    );
  }

  Widget _popularDoctorCard(
    String name,
    String specialty,
    String image,
    int rating,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(8.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // IMAGE below text & rating — make it flexible
            Flexible(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.asset(
                  image,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              name,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 4.h),

            // Specialty
            Text(
              specialty,
              style: TextStyle(fontSize: 12.sp, color: Colors.black54),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 6.h),

            // Rating
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
    );
  }
}
