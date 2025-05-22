// doctor_provider.dart

import 'package:flutter/material.dart';

class DoctorProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _allDoctors = [
    {
      'name': 'Dr. Shruti Kedia',
      'specialty': 'Tooths Dentist',
      'experience': '7 Years',
      'rating': '97%',
      'stories': '69 Patient Stories',
      'image': 'assets/live_chat/comment1.jpg',
    },
    {
      'name': 'Dr. Watamaniuk',
      'specialty': 'Tooths Dentist',
      'experience': '9 Years',
      'rating': '74%',
      'stories': '78 Patient Stories',
      'image': 'assets/live_chat/live_chat.jpg',
    },
    {
      'name': 'Dr. Crownover',
      'specialty': 'Tooths Dentist',
      'experience': '5 Years',
      'rating': '59%',
      'stories': '86 Patient Stories',
      'image': 'assets/live_chat/comment3.jpg',
    },
    {
      'name': 'Dr. Balestra',
      'specialty': 'Tooths Dentist',
      'experience': '6 Years',
      'rating': '',
      'stories': '',
      'image': 'assets/live_chat/live_chat.jpg',
    },
    {
      'name': 'Dr. Alina Roy',
      'specialty': 'Orthodontist',
      'experience': '10 Years',
      'rating': '88%',
      'stories': '120 Patient Stories',
      'image': 'assets/live_chat/comment2.jpg',
    },
    {
      'name': 'Dr. Brian Thomas',
      'specialty': 'Pediatric Dentist',
      'experience': '8 Years',
      'rating': '92%',
      'stories': '95 Patient Stories',
      'image': 'assets/live_chat/comment4.jpg',
    },
    {
      'name': 'Dr. Cynthia Evans',
      'specialty': 'Cosmetic Dentist',
      'experience': '11 Years',
      'rating': '90%',
      'stories': '102 Patient Stories',
      'image': 'assets/live_chat/comment1.jpg',
    },
    {
      'name': 'Dr. Daniel Kim',
      'specialty': 'Oral Surgeon',
      'experience': '7 Years',
      'rating': '85%',
      'stories': '87 Patient Stories',
      'image': 'assets/live_chat/comment3.jpg',
    },
    {
      'name': 'Dr. Eva Green',
      'specialty': 'Endodontist',
      'experience': '6 Years',
      'rating': '76%',
      'stories': '65 Patient Stories',
      'image': 'assets/live_chat/live_chat.jpg',
    },
  ];

  List<Map<String, dynamic>> _filteredDoctors = [];
  bool _noMatchFound = false;

  List<Map<String, dynamic>> get doctors => _filteredDoctors;
  bool get noMatchFound => _noMatchFound;

  DoctorProvider() {
    _filteredDoctors = [..._allDoctors]; // initially all doctors
  }

  void searchDoctor(String query) {
    _noMatchFound = false;

    if (query.isEmpty) {
      _filteredDoctors = [..._allDoctors];
    } else {
      final matching = _allDoctors.where((doc) =>
          doc['name'].toLowerCase().contains(query.toLowerCase())).toList();

      if (matching.isEmpty) {
        _filteredDoctors = [];
        _noMatchFound = true;
      } else {
        final others = _allDoctors
            .where((doc) =>
                !doc['name'].toLowerCase().contains(query.toLowerCase()))
            .toList();
        _filteredDoctors = [...matching, ...others];
      }
    }

    notifyListeners();
  }
}
