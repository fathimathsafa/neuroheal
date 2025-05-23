import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:neuroheal/presentation/patient_side/appoinment_details_screen/service/appoinment_details_service.dart';

class AllAppointmentsScreen extends StatefulWidget {
  const AllAppointmentsScreen({Key? key}) : super(key: key);

  @override
  State<AllAppointmentsScreen> createState() => _AllAppointmentsScreenState();
}

class _AllAppointmentsScreenState extends State<AllAppointmentsScreen> {
  late Future<List<Appointment>> _appointmentsFuture;

  @override
  void initState() {
    super.initState();
    _appointmentsFuture = fetchAllAppointments();
  }

  Future<List<Appointment>> fetchAllAppointments() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('appointment_details').get();

    return snapshot.docs
        .map((doc) => Appointment.fromFirestore(doc))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Appointments'),
      ),
      body: FutureBuilder<List<Appointment>>(
        future: _appointmentsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No appointments found.'));
          } else {
            final appointments = snapshot.data!;
            return ListView.builder(
              itemCount: appointments.length,
              itemBuilder: (context, index) {
                final appointment = appointments[index];
                return ListTile(
                  title: Text(appointment.name),
                  subtitle: Text(
                      'Date: ${appointment.appointmentDate.toLocal().toString().split(' ')[0]} | Time: ${appointment.appointmentTime}'),
                  trailing: Text(appointment.reminder),
                  onTap: () {
                    // Optional: navigate to detail screen if needed
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
