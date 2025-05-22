import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r), // Responsive corner radius
      ),
      child: Padding(
        padding: EdgeInsets.all(4.w), // Responsive padding
        child: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 15.sp, // Responsive icon size
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}