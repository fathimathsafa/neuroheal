import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:neuroheal/core/constants/app_colors.dart';
import 'package:neuroheal/core/constants/app_text_styles.dart';
import 'package:neuroheal/core/common/widget/screen_background.dart';
import 'package:neuroheal/presentation/patient_side/bottom_navigation_screen/view/bottom_navigation.dart';
import 'package:table_calendar/table_calendar.dart';

class AppointmentCalendarScreen extends StatefulWidget {
  final String name;
  final String age;
  final String contact;
  final String relation;

  const AppointmentCalendarScreen({
    Key? key,
    required this.name,
    required this.age,
    required this.contact,
    required this.relation,
  }) : super(key: key);


  @override
  State<AppointmentCalendarScreen> createState() =>
      _AppointmentCalendarScreenState();
}

class _AppointmentCalendarScreenState extends State<AppointmentCalendarScreen> {
  String? selectedReminder;
  String? selectedTime;
  DateTime? _selectedDay;
  DateTime _focusedDay = DateTime.now();

  final List<String> reminderTimes = ['25 min', '47 min', '1 hr'];
  final List<String> timeSlots = [
    '10:00 AM',
    '12:00 PM',
    '2:00 PM',
    '4:00 PM',
    '6:00 PM',
  ];

  // You can store the docId here if you want to update later, null means new doc
  String? appointmentDocId;

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
  }
Future<void> saveNewAppointment() async {
  if (_selectedDay == null || selectedTime == null || selectedReminder == null) {
    return;
  }
  try {
    // Create a new document reference with auto-generated ID
    DocumentReference docRef = FirebaseFirestore.instance
        .collection('appointment_details')
        .doc(); // no argument means auto generate ID

    // Use the docRef.id to store document ID inside the document data
    await docRef.set({
      'appointment_date': _selectedDay!.toIso8601String(),
      'appointment_time': selectedTime,
      'reminder': selectedReminder,
      'created_at': FieldValue.serverTimestamp(),

      // Patient details from widget
      'name': widget.name,
      'age': widget.age,
      'contact': widget.contact,
      'relation': widget.relation,

      // Store the document ID inside the document
      'appointment_id': docRef.id,
    });

    appointmentDocId = docRef.id;
  } catch (e) {
    print('Error saving new appointment: $e');
  }
}


 Future<void> updateAppointmentDetails({
  required String docId,
  required DateTime selectedDate,
  required String selectedTime,
  required String selectedReminder,
}) async {
  try {
    await FirebaseFirestore.instance
        .collection('appointment_details')
        .doc(docId)
        .update({
      'appointment_date': selectedDate.toIso8601String(),
      'appointment_time': selectedTime,
      'reminder': selectedReminder,
      'updated_at': FieldValue.serverTimestamp(),
      'name': widget.name,
      'age': widget.age,
      'contact': widget.contact,
      'relation': widget.relation,
    });
  } catch (e) {
    print('Error updating appointment details: $e');
    rethrow;
  }
}

  bool validateSelection() {
    if (_selectedDay == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a date')),
      );
      return false;
    }
    if (selectedTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a time')),
      );
      return false;
    }
    if (selectedReminder == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a reminder time')),
      );
      return false;
    }
    return true;
  }

  void onConfirmPressed() async {
    if (!validateSelection()) return;

    if (appointmentDocId == null) {
      // Save new appointment
      await saveNewAppointment();
    } else {
      // Update existing appointment
      await updateAppointmentDetails(
        docId: appointmentDocId!,
        selectedDate: _selectedDay!,
        selectedTime: selectedTime!,
        selectedReminder: selectedReminder!,
      );
    }

    showAppointmentSuccessDialog(context);
  }

  void showAppointmentSuccessDialog(BuildContext context) {
    final appointmentDateStr = _selectedDay != null
        ? "${_selectedDay!.day.toString().padLeft(2, '0')}/${_selectedDay!.month.toString().padLeft(2, '0')}/${_selectedDay!.year}"
        : "";

    final displayTime = selectedTime ?? "";

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          backgroundColor: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 70.w,
                  height: 70.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color.fromARGB(255, 214, 234, 227),
                  ),
                  child: Icon(
                    Icons.thumb_up_alt_rounded,
                    color: const Color(0xFF00C853),
                    size: 36.sp,
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  "Thank you",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  "Your Appointment Successful.\n"
                  "You booked an appointment with Dr. Pediatrician Purpieson\n"
                  "on $appointmentDateStr, at $displayTime.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14.sp, color: Colors.black87),
                ),
                SizedBox(height: 24.h),
                SizedBox(
                  width: double.infinity,
                  height: 45.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00C853),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomNavigationScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Done",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.surfaceColor,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                GestureDetector(
                  onTap: () {
                    // Handle edit (if needed)
                  },
                  child: Text(
                    "Edit your appointment",
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.blueAccent,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                child: Row(
                  children: [
                    Flexible(
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back_ios_new, size: 20.sp),
                      ),
                    ),
                    SizedBox(width: 24.w),
                    Flexible(
                      child: Text(
                        'Appointment',
                        style: AppTextStyles.appBarHeadding,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12.r),
                          topRight: Radius.circular(12.r),
                        ),
                        child: TableCalendar(
                          firstDay: DateTime.utc(2020, 1, 1),
                          lastDay: DateTime.utc(2030, 12, 31),
                          focusedDay: _focusedDay,
                          calendarFormat: CalendarFormat.month,
                          selectedDayPredicate: (day) =>
                              isSameDay(_selectedDay, day),
                          onDaySelected: (selectedDay, focusedDay) {
                            setState(() {
                              _selectedDay = selectedDay;
                              _focusedDay = focusedDay;
                            });
                          },
                          headerStyle: HeaderStyle(
                            formatButtonVisible: false,
                            titleCentered: true,
                            titleTextStyle: GoogleFonts.poppins(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF00C853),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12.r),
                                topRight: Radius.circular(12.r),
                              ),
                            ),
                            leftChevronIcon: Icon(
                              Icons.chevron_left,
                              color: Colors.white,
                            ),
                            rightChevronIcon: Icon(
                              Icons.chevron_right,
                              color: Colors.white,
                            ),
                          ),
                          calendarStyle: CalendarStyle(
                            todayDecoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            todayTextStyle: TextStyle(color: Colors.black),
                            selectedDecoration: BoxDecoration(
                              color: const Color(0xFF00C853),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            selectedTextStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Select Time',
                              style: GoogleFonts.poppins(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: 12.h),
                            Wrap(
                              spacing: 10.w,
                              runSpacing: 10.h,
                              children: timeSlots.map((time) {
                                final isSelected = time == selectedTime;
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedTime = time;
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10.h, horizontal: 16.w),
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? const Color(0xFF00C853)
                                          : Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(20.r),
                                    ),
                                    child: Text(
                                      time,
                                      style: TextStyle(
                                        color: isSelected
                                            ? Colors.white
                                            : Colors.black87,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                            SizedBox(height: 24.h),
                            Text(
                              'Select Reminder',
                              style: GoogleFonts.poppins(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: 12.h),
                            Wrap(
                              spacing: 10.w,
                              runSpacing: 10.h,
                              children: reminderTimes.map((reminder) {
                                final isSelected = reminder == selectedReminder;
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedReminder = reminder;
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10.h, horizontal: 16.w),
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? const Color(0xFF00C853)
                                          : Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(20.r),
                                    ),
                                    child: Text(
                                      reminder,
                                      style: TextStyle(
                                        color: isSelected
                                            ? Colors.white
                                            : Colors.black87,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                            SizedBox(height: 40.h),
                            SizedBox(
                              width: double.infinity,
                              height: 48.h,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF00C853),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                ),
                                onPressed: onConfirmPressed,
                                child: Text(
                                  'Confirm Appointment',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
