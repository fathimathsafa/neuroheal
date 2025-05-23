import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuroheal/presentation/auth_screens/login_screen/view/login_screen.dart';
import 'package:neuroheal/presentation/auth_screens/registration_screen/view/registration_screen.dart';
import 'package:neuroheal/presentation/doctor_side/all_record_screen/view/all_record_screen.dart';
import 'package:neuroheal/presentation/doctor_side/medical_record_screen/view/medical_record_screen.dart';
import 'package:neuroheal/presentation/doctor_side/my_pateient_screen/view/my_patient_screen.dart';
import 'package:neuroheal/presentation/patient_side/booking_history_screen/view/booking_history.dart';
import 'package:neuroheal/presentation/patient_side/doctor_profile_screen/view/doctor_profile_screen.dart';
import 'package:neuroheal/presentation/patient_side/find_doctor_screen/controller/find_doctor_controller.dart';
import 'package:provider/provider.dart';

import 'package:neuroheal/presentation/patient_side/appoinment_calender_screen/view/appoinment_calender_screen.dart';
import 'package:neuroheal/presentation/patient_side/bottom_navigation_screen/view/bottom_navigation.dart';
import 'package:neuroheal/presentation/patient_side/chat_screen/view/chat_screen.dart';
import 'package:neuroheal/presentation/patient_side/doctor_appoinment_screen/view/doctor_appoinment_screen.dart';
import 'package:neuroheal/presentation/patient_side/doctor_details_screen/view/doctor_details_screen.dart';
import 'package:neuroheal/presentation/patient_side/doctor_select_time_screen/view/doctor_select_time_screen.dart';
import 'package:neuroheal/presentation/patient_side/favourite_doctor_screen/view/favourite_doctor_screen.dart';
import 'package:neuroheal/presentation/patient_side/find_doctor_screen/view/find_doctor_screen.dart';
import 'package:neuroheal/presentation/patient_side/home_screen_patient/view/home_screen.dart';
import 'package:neuroheal/presentation/patient_side/live_chat_screen/view/live_chat_screen.dart';
import 'package:neuroheal/presentation/common_screens/on_boarding_screen/view/on_boarding_screen.dart';
import 'package:neuroheal/presentation/patient_side/popular_doctor_screen/view/popular_doctor_screen.dart';
import 'package:neuroheal/presentation/common_screens/splash_screen/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder:
          (context, child) => MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => DoctorProvider()),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              home: LoginScreen  (),
            ),
          ),
    );
  }
}
