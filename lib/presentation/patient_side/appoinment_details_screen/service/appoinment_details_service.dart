import 'package:cloud_firestore/cloud_firestore.dart';

class Appointment {
  final String id;
  final String name;
  final int age;
  final String contact;
  final String relation;
  final DateTime appointmentDate;
  final String appointmentTime;
  final String reminder;

  Appointment({
    required this.id,
    required this.name,
    required this.age,
    required this.contact,
    required this.relation,
    required this.appointmentDate,
    required this.appointmentTime,
    required this.reminder,
  });

  factory Appointment.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Appointment(
      id: doc.id,
      name: data['name'] ?? '',
      age: data['age'] ?? 0,
      contact: data['contact'] ?? '',
      relation: data['relation'] ?? '',
      appointmentDate: DateTime.parse(data['appointment_date']),
      appointmentTime: data['appointment_time'] ?? '',
      reminder: data['reminder'] ?? '',
    );
  }
}
