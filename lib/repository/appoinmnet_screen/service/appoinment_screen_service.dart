import 'package:cloud_firestore/cloud_firestore.dart';

Future<String?> saveInitialPatientDetails({
  required String name,
  required String contact,
  required int age,
  required String relation,
}) async {
  try {
    final docRef = await FirebaseFirestore.instance
        .collection('appointment_details')
        .add({
      'name': name,
      'contact': contact,
      'age': age,
      'relation': relation,
      'created_at': Timestamp.now(),
    });
    return docRef.id;
  } catch (e) {
    print('Error saving patient details: $e');
    return null;
  }
}
