import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuroheal/core/constants/app_colors.dart';

class DoctorLiveChatScreen extends StatelessWidget {
  const DoctorLiveChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image (doctor)
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.grey,
              image: DecorationImage(
                image: AssetImage('assets/live_chat/live_chat.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Navigation and profile picture
          Positioned(
            top: 20.h,
            left: 0,
            right: 0,
            child: _buildNavBar(context),
          ),

          // Comments section
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildCommentsSection(),
          ),
        ],
      ),
    );
  }

  Widget _buildNavBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            borderRadius: BorderRadius.circular(20.r),
            child: Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.surfaceColor,
              size: 16.sp,
            ),
          ),
          CircleAvatar(
            backgroundImage: AssetImage("assets/live_chat/live_chat.jpg"),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentsSection() {
    // Comment data
    List<Map<String, dynamic>> comments = [
      {
        'name': 'Everhart Tween',
        'avatar': 'assets/live_chat/comment4.jpg',
        'comment': 'Thanks for sharing doctor ❤️',
      },
      {
        'name': 'Bonebrake Mash',
        'avatar': 'assets/live_chat/comment3.jpg',
        'comment': 'They treat immune system disorders',
      },
      {
        'name': 'Handler Wack',
        'avatar': 'assets/live_chat/comment2.jpg',
        'comment': 'This is the largest directory 👍',
      },
      {
        'name': 'Comfort Love',
        'avatar': 'assets/live_chat/comment1.jpg',
        'comment': 'Depending on their education 👨‍⚕️',
      },
    ];

    return Container(
      padding: EdgeInsets.only(top: 16.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black.withOpacity(0.0),
            Colors.black.withOpacity(0.6),
            Colors.black.withOpacity(0.8),
          ],
        ),
      ),
      child: Column(
        children: [
          // Comments list
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: comments.length,
            itemBuilder: (context, index) {
              return _buildCommentItem(
                comments[index]['name'],
                comments[index]['avatar'],
                comments[index]['comment'],
              );
            },
          ),

          // Comment input field
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Container(
              height: 50.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25.r),
              ),
              child: Row(
                children: [
                  SizedBox(width: 12.w),
                  Container(
                    width: 30.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1ED19D),
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Icon(
                      Icons.chat_bubble_outline,
                      color: Colors.white,
                      size: 18.sp,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Add a Comment......',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.sp,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.sentiment_satisfied_alt,
                    color: Colors.grey,
                    size: 24.sp,
                  ),
                  SizedBox(width: 12.w),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentItem(String name, String avatar, String comment) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(backgroundImage: AssetImage(avatar)),
          // Container(
          //   width: 40.w,
          //   height: 40.h,
          //   decoration: BoxDecoration(
          //     color: Colors.grey,
          //     borderRadius: BorderRadius.circular(20.r),
          //     image: DecorationImage(
          //       image: NetworkImage(avatar),
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  comment,
                  style: TextStyle(fontSize: 12.sp, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
