import 'package:flutter/material.dart';
import 'package:neuroheal/core/constants/app_colors.dart';
import 'package:neuroheal/presentation/patient_side/booking_history_screen/view/booking_history.dart';
import 'package:neuroheal/presentation/patient_side/chat_screen/view/chat_screen.dart';
import 'package:neuroheal/presentation/patient_side/doctor_appoinment_screen/view/doctor_appoinment_screen.dart';
import 'package:neuroheal/presentation/patient_side/doctor_details_screen/view/doctor_details_screen.dart';
import 'package:neuroheal/presentation/patient_side/doctor_profile_screen/view/doctor_profile_screen.dart';
import 'package:neuroheal/presentation/patient_side/favourite_doctor_screen/view/favourite_doctor_screen.dart';
import 'package:neuroheal/presentation/patient_side/find_doctor_screen/view/find_doctor_screen.dart';
import 'package:neuroheal/presentation/patient_side/home_screen_doctor/view/home_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    DoctorHomeScreen(),
    FindDoctorsScreen(),
   BookingHistoryScreen(),
    ModelProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primaryColor, // Color when selected
        unselectedItemColor: Colors.grey, // Color when not selected
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }
}
