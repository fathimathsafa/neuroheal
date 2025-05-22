import 'package:flutter/material.dart';
import 'package:neuroheal/core/constants/app_colors.dart';
import 'package:neuroheal/core/common/widget/screen_background.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neuroheal/presentation/patient_side/booking_history_screen/model/booking_model.dart';
import 'package:neuroheal/presentation/patient_side/booking_history_screen/widget/booking_card.dart';
// Path to your BookingCard

class BookingHistoryScreen extends StatelessWidget {
  const BookingHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: Text(
              'Booking History',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            bottom: TabBar(
              indicatorColor: AppColors.primaryColor,
              labelColor: AppColors.primaryColor,
              unselectedLabelColor: Colors.black54,
              tabs: const [
                Tab(text: "Today"),
                Tab(text: "Upcoming"),
                Tab(text: "History"),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              BookingListView(bookings: sampleToday),
              BookingListView(bookings: sampleUpcoming),
              BookingListView(bookings: sampleHistory),
            ],
          ),
        ),
      ),
    );
  }
}

class BookingListView extends StatelessWidget {
  final List<BookingModel> bookings;

  const BookingListView({super.key, required this.bookings});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(12.w),
      itemCount: bookings.length,
      itemBuilder: (context, index) {
        return BookingCard(booking: bookings[index]);
      },
    );
  }
}

// 🔽 Sample Data
final List<BookingModel> sampleToday = [
  BookingModel(patientName: "Alice", doctorName: "Dr. John", appointmentDate: "2025-05-22"),
  BookingModel(patientName: "Bob", doctorName: "Dr. Smith", appointmentDate: "2025-05-22"),
];

final List<BookingModel> sampleUpcoming = [
  BookingModel(patientName: "Charlie", doctorName: "Dr. Emily", appointmentDate: "2025-05-25"),
  BookingModel(patientName: "Diana", doctorName: "Dr. Alex", appointmentDate: "2025-05-27"),
];

final List<BookingModel> sampleHistory = [
  BookingModel(patientName: "Eva", doctorName: "Dr. Mike", appointmentDate: "2025-05-01"),
  BookingModel(patientName: "Frank", doctorName: "Dr. Rose", appointmentDate: "2025-04-18"),
];

