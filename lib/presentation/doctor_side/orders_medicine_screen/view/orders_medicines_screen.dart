import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuroheal/core/common/widget/custom_header.dart';
import 'package:neuroheal/core/common/widget/screen_background.dart';


class MedicinesOrdersScreen extends StatelessWidget {
  const MedicinesOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = 1.sw;
    final screenHeight = 1.sh;
    final isTablet = screenWidth > 600.w;

    final List<Map<String, dynamic>> orderOptions = [
      {'icon': Icons.assignment_outlined, 'text': 'Guide to medicine\norder'},
      {
        'icon': Icons.receipt_long_outlined,
        'text': 'Prescription related\nissues',
      },
      {'icon': Icons.shopping_cart_outlined, 'text': 'Order status'},
      {'icon': Icons.local_shipping_outlined, 'text': 'Order delivery'},
      {'icon': Icons.credit_card_outlined, 'text': 'Payments & Refunds'},
      {'icon': Icons.reply_outlined, 'text': 'Order returns'},
    ];

    return Scaffold(
      body: GradientBackground(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: Row(
                  children: [
                    const CustomHeader(title: 'Medicines orders'),
                    // SizedBox(width: 10.w),
                    // Text(
                    //   'Medicines orders',
                    //   style: TextStyle(
                    //     color: Colors.black,
                    //     fontSize: 20.sp,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                  ],
                ),
              ),

              // Search bar
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {},
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(14.w),
                  ),
                ),
              ),
              SizedBox(height: 24.h),

              // GridView
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isTablet ? 3 : 2,
                  crossAxisSpacing: 14.w,
                  mainAxisSpacing: 14.h,
                  childAspectRatio: isTablet ? 1.0 : 0.9,
                ),
                itemCount: orderOptions.length,
                itemBuilder: (context, index) {
                  final option = orderOptions[index];
                  return _buildOrderOption(
                    icon: option['icon'],
                    text: option['text'],
                    onTap: () => debugPrint('${option['text']} tapped'),
                    isTablet: isTablet,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrderOption({
    required IconData icon,
    required String text,
    required bool isTablet,
    required VoidCallback onTap,
  }) {
    final iconSize = isTablet ? 40.sp : 30.sp;
    final fontSize = isTablet ? 16.sp : 14.sp;

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: iconSize * 1.5,
              height: iconSize * 1.5,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.teal.shade100,
              ),
              child: Icon(icon, size: iconSize, color: Colors.teal),
            ),
            SizedBox(height: 10.h),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: fontSize),
            ),
          ],
        ),
      ),
    );
  }
}
