import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neuroheal/core/constants/app_colors.dart';
import 'package:neuroheal/core/constants/app_text_styles.dart';
import 'package:neuroheal/core/common/widget/screen_background.dart';
import 'package:neuroheal/presentation/patient_side/bottom_navigation_screen/view/bottom_navigation.dart';
import 'package:table_calendar/table_calendar.dart';

class AppointmentCalendarScreen extends StatefulWidget {
  const AppointmentCalendarScreen({Key? key}) : super(key: key);

  @override
  State<AppointmentCalendarScreen> createState() =>
      _AppointmentCalendarScreenState();
}

class _AppointmentCalendarScreenState extends State<AppointmentCalendarScreen> {
  // Selected date, time and reminder
  String? selectedReminder;
  String? selectedTime;
  DateTime? _selectedDay;

  DateTime selectedDate = DateTime(2021, 2, 17);
  final List<String> reminderTimes = ['25 min', '47 min', '1 hr'];
  final List<String> timeSlots = [
    '10:00 AM',
    '12:00 PM',
    '2:00 PM',
    '4:00 PM',
    '6:00 PM',
  ];

  // Inside your state class

  DateTime _focusedDay = DateTime.now();

  void showAppointmentSuccessDialog(BuildContext context) {
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
                // Circle with thumbs-up icon
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

                // Title
                Text(
                  "Thank you",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.h),

                // Subtext
                Text(
                  "Your Appointment Successful.\n"
                  "You booked an appointment with Dr. Pediatrician Purpieson\n"
                  "on February 21, at 02:00 PM.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14.sp, color: Colors.black87),
                ),
                SizedBox(height: 24.h),

                // Done button
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
                      Navigator.push(
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

                // Edit appointment text
                GestureDetector(
                  onTap: () {
                    // Handle edit
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
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
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
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
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
                          selectedDayPredicate:
                              (day) => isSameDay(_selectedDay, day),
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
                            ),
                            leftChevronIcon: Icon(
                              Icons.chevron_left,
                              size: 15.sp,
                              color: Colors.white,
                            ),
                            rightChevronIcon: Icon(
                              Icons.chevron_right,
                              size: 15.sp,
                              color: Colors.white,
                            ),
                          ),
                          daysOfWeekHeight: 30.sp,
                          daysOfWeekStyle: DaysOfWeekStyle(
                            weekdayStyle: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            weekendStyle: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          calendarStyle: CalendarStyle(
                            isTodayHighlighted: true,
                            selectedDecoration: BoxDecoration(
                              color: const Color(0xFF00C853),
                              shape: BoxShape.circle,
                            ),
                            selectedTextStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            todayDecoration: BoxDecoration(
                              color: Colors.green.shade200,
                              shape: BoxShape.circle,
                            ),
                            defaultTextStyle: TextStyle(fontSize: 14.sp),
                            weekendTextStyle: TextStyle(fontSize: 14.sp),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (_selectedDay != null) ...[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          spreadRadius: 2,
                          offset: const Offset(0, 5),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Available Time',
                          style: AppTextStyles.smallHeadding,
                        ),
                        SizedBox(height: 12.h),
                        Wrap(
                          spacing: 10.w,
                          runSpacing: 10.h,
                          children:
                              timeSlots.map((time) {
                                final isSelected = time == selectedTime;
                                return GestureDetector(
                                  onTap:
                                      () => setState(() => selectedTime = time),
                                  child: Container(
                                    width: 60.w,
                                    height: 60.w,
                                    decoration: BoxDecoration(
                                      color:
                                          isSelected
                                              ? const Color(0xFF00C853)
                                              : const Color.fromARGB(
                                                255,
                                                214,
                                                234,
                                                227,
                                              ),
                                      shape: BoxShape.circle,

                                      boxShadow: [
                                        if (isSelected)
                                          BoxShadow(
                                            color: const Color(
                                              0xFF00C853,
                                            ).withOpacity(0.3),
                                            blurRadius: 8,
                                            offset: const Offset(0, 4),
                                          ),
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          time.split(
                                            ' ',
                                          )[0], // Example: '10:00'
                                          style: TextStyle(
                                            color:
                                                isSelected
                                                    ? Colors.white
                                                    : const Color(0xFF00C853),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                        Text(
                                          time.split(' ').length > 1
                                              ? time.split(' ')[1]
                                              : '', // Example: 'AM'
                                          style: TextStyle(
                                            color:
                                                isSelected
                                                    ? Colors.white
                                                    : const Color(0xFF00C853),
                                            fontSize: 10.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),
                        ),
                        SizedBox(height: 24.h),
                        Text(
                          'Remind Me Before',
                          style: AppTextStyles.smallHeadding,
                        ),
                        SizedBox(height: 12.h),
                        Wrap(
                          spacing: 10.w,
                          runSpacing: 10.h,
                          children:
                              reminderTimes.map((time) {
                                final isSelected = time == selectedReminder;
                                return GestureDetector(
                                  onTap:
                                      () => setState(
                                        () => selectedReminder = time,
                                      ),
                                  child: Container(
                                    width: 60.w,
                                    height: 60.w,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color:
                                          isSelected
                                              ? const Color(0xFF00C853)
                                              : const Color.fromARGB(
                                                255,
                                                214,
                                                234,
                                                227,
                                              ),
                                      shape: BoxShape.circle,

                                      boxShadow: [
                                        if (isSelected)
                                          BoxShadow(
                                            color: const Color(
                                              0xFF00C853,
                                            ).withOpacity(0.3),
                                            blurRadius: 8,
                                            offset: const Offset(0, 4),
                                          ),
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          time.split(' ')[0], // e.g., '25'
                                          style: TextStyle(
                                            color:
                                                isSelected
                                                    ? Colors.white
                                                    : const Color(0xFF00C853),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                        Text(
                                          time.split(' ').length > 1
                                              ? time.split(' ')[1]
                                              : '', // e.g., 'min'
                                          style: TextStyle(
                                            color:
                                                isSelected
                                                    ? Colors.white
                                                    : const Color(0xFF00C853),
                                            fontSize: 10.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),
                        ),
                        SizedBox(height: 30.h),
                        SizedBox(
                          width: double.infinity,
                          height: 48.h,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF00C853),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),
                            onPressed: () {
                              showAppointmentSuccessDialog(context);
                            },
                            child: Text(
                              "Confirm",
                              style: AppTextStyles.buttonText,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
