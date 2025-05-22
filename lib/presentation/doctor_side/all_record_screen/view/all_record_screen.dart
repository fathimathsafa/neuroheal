import 'package:flutter/material.dart';
import 'package:neuroheal/core/common/widget/custom_header.dart';
import 'package:neuroheal/core/common/widget/screen_background.dart';
import 'package:neuroheal/presentation/doctor_side/medical_record_screen/view/medical_record_screen.dart';

class AllRecordsScreen extends StatelessWidget {
  const AllRecordsScreen({Key? key})
    : super(key: key); // Added const constructor

  final List<RecordItem> records = const [
    // Made records const as its content is immutable
    RecordItem(
      date: '27',
      month: 'FEB',
      name: 'Abdullah mamun',
      details: '1 Prescription',
    ),
    RecordItem(
      date: '28',
      month: 'FEB',
      name: 'Abdullah shuvo',
      details: '1 Prescription',
    ),
    RecordItem(
      date: '01',
      month: 'MAR',
      name: 'Shruti Kedia',
      details: '1 Prescription',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: Column(
          // Wrap content in a Column to stack header and list
          children: [
            // Custom Header
            const CustomHeader(title: "All Records"),

            Expanded(
              // Use Expanded to make ListView take remaining space
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                ), // Keep horizontal padding for list items
                itemCount: records.length,
                itemBuilder: (context, index) {
                  return RecordCard(record: records[index]);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Handle add record action
            // You might want to navigate to AddRecordScreen here
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => MedicalRecordsScreen()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal,
            padding: const EdgeInsets.symmetric(vertical: 16.0), // Added const
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: const Text(
            // Added const
            'Add a record',
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
        ),
      ),
    );
  }
}

class RecordItem {
  final String date;
  final String month;
  final String name;
  final String details;

  const RecordItem({
    // Added const constructor
    required this.date,
    required this.month,
    required this.name,
    required this.details,
  });
}

class RecordCard extends StatelessWidget {
  final RecordItem record;

  const RecordCard({Key? key, required this.record}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12.0), // Added const
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0), // Added const
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: Colors.teal.shade100,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    record.date,
                    style: const TextStyle(
                      // Added const
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  Text(
                    record.month,
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: Colors.teal,
                    ), // Added const
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16.0), // Added const
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Records added by you',
                    style: TextStyle(
                      // No const here as color is dynamic
                      fontSize: 12.0,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  Text(
                    'Record for ${record.name}',
                    style: const TextStyle(
                      // Added const
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    record.details,
                    style: TextStyle(
                      // No const here as color is dynamic
                      fontSize: 14.0,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 8.0), // Added const
                  Container(
                    padding: const EdgeInsets.symmetric(
                      // Added const
                      horizontal: 8.0,
                      vertical: 4.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Text(
                      'NEW',
                      style: TextStyle(
                        // No const here as color is dynamic
                        color: Colors.green.shade800,
                        fontSize: 10.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.grey.shade600,
              ), // No const here as color is dynamic
              onPressed: () {
                // Handle more options
              },
            ),
          ],
        ),
      ),
    );
  }
}
