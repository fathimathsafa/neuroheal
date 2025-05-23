import 'package:cloud_firestore/cloud_firestore.dart';

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
      'updated_at': Timestamp.now(),
    });
  } catch (e) {
    print('Error updating appointment details: $e');
    rethrow;
  }
}
