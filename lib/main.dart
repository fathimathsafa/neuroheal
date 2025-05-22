import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuroheal/presentation/booking_history_screen/view/booking_history.dart';
import 'package:neuroheal/presentation/find_doctor_screen/controller/find_doctor_controller.dart';
import 'package:provider/provider.dart';

import 'package:neuroheal/presentation/appoinment_calender_screen/view/appoinment_calender_screen.dart';
import 'package:neuroheal/presentation/bottom_navigation_screen/view/bottom_navigation.dart';
import 'package:neuroheal/presentation/chat_screen/view/chat_screen.dart';
import 'package:neuroheal/presentation/doctor_appoinment_screen/view/doctor_appoinment_screen.dart';
import 'package:neuroheal/presentation/doctor_details_screen/view/doctor_details_screen.dart';
import 'package:neuroheal/presentation/doctor_select_time_screen/view/doctor_select_time_screen.dart';
import 'package:neuroheal/presentation/favourite_doctor_screen/view/favourite_doctor_screen.dart';
import 'package:neuroheal/presentation/find_doctor_screen/view/find_doctor_screen.dart';
import 'package:neuroheal/presentation/home_screen/view/home_screen.dart';
import 'package:neuroheal/presentation/live_chat_screen/view/live_chat_screen.dart';
import 'package:neuroheal/presentation/on_boarding_screen/view/on_boarding_screen.dart';
import 'package:neuroheal/presentation/popular_doctor_screen/view/popular_doctor_screen.dart';
import 'package:neuroheal/presentation/splash_screen/view/splash_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => DoctorProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: BookingHistoryScreen(),
        ),
      ),
    );
  }
}
