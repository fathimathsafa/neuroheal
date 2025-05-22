import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuroheal/core/common/widget/custom_back_button.dart';


class CustomHeader extends StatelessWidget {
  final String title;
  final EdgeInsetsGeometry? padding;

  const CustomHeader({Key? key, required this.title, this.padding})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          padding ??
          EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h), // default
      child: Row(
        children: [
          const CustomBackButton(),
          SizedBox(width: 12.w),
          Text(
            title,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
