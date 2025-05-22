import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:neuroheal/core/common/widget/custom_header.dart';
import 'package:neuroheal/core/common/widget/screen_background.dart';

// ... other imports

class AddRecordScreen extends StatefulWidget {
  const AddRecordScreen({Key? key}) : super(key: key);

  @override
  State<AddRecordScreen> createState() => _RecordCreationScreenState();
}

class _RecordCreationScreenState extends State<AddRecordScreen> {
  final String userName = "Abdullah Mamun";
  String selectedRecordType = "Report";
  final DateTime recordDate = DateTime(2021, 2, 27);
  List<String> images = ["assets/photo.jpg"]; // Ensure this asset exists

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GradientBackground(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Custom Header
                Padding(
                  padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                  child: Row(
                    children: [
                      CustomHeader(title: "Add Records"),
                      SizedBox(width: 20.w),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),

                // Images Section
                SizedBox(
                  height: 0.25.sw, // screen width * 0.25
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: images.length + 1,
                    itemBuilder: (context, index) {
                      if (index == images.length) {
                        return _buildAddImageBox();
                      }
                      return _buildImageBox(index);
                    },
                  ),
                ),

                SizedBox(height: 30.h),

                // Record For Section
                _buildInfoItem(
                  title: "Record for",
                  content: userName,
                  hasEditButton: true,
                ),

                SizedBox(height: 20.h),

                // Record Type Section
                Text(
                  "Type of record",
                  style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                ),
                SizedBox(height: 10.h),
                _buildRecordTypeOptions(),

                SizedBox(height: 20.h),

                // Record Creation Date Section
                _buildInfoItem(
                  title: "Record created on",
                  content: DateFormat('dd MMM, yyyy').format(recordDate),
                  hasEditButton: true,
                ),

                Spacer(),

                // Upload Button
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 50.h),
                  child: ElevatedButton(
                    onPressed: _showAddRecordBottomSheet,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      padding: EdgeInsets.symmetric(vertical: 15.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: Text(
                      "Upload record",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImageBox(int index) {
    return Container(
      width: 0.22.sw,
      height: 0.22.sw,
      margin: EdgeInsets.only(right: 10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: Colors.grey[200],
      ),
      clipBehavior: Clip.hardEdge,
      child: Image.asset(images[index], fit: BoxFit.cover),
    );
  }

  Widget _buildAddImageBox() {
    return GestureDetector(
      onTap: _showAddRecordBottomSheet,
      child: Container(
        width: 0.22.sw,
        height: 0.22.sw,
        margin: EdgeInsets.only(right: 10.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: Colors.green.withOpacity(0.1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add, color: const Color.fromARGB(255, 22, 150, 111)),
            SizedBox(height: 5.h),
            Text(
              "Add more\nimages",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color.fromARGB(255, 22, 150, 111),
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem({
    required String title,
    required String content,
    bool hasEditButton = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: TextStyle(color: Colors.black, fontSize: 14.sp)),
            if (hasEditButton)
              IconButton(
                icon: Icon(Icons.edit, color: Colors.grey, size: 18.sp),
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
                onPressed: () {},
              ),
          ],
        ),
        SizedBox(height: 5.h),
        Text(
          content,
          style: TextStyle(
            color: const Color.fromARGB(255, 22, 150, 111),
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildRecordTypeOptions() {
    return Row(
      children: [
        _buildRecordTypeOption(
          icon: Icons.description,
          label: "Report",
          isSelected: selectedRecordType == "Report",
          onTap: () {
            setState(() {
              selectedRecordType = "Report";
            });
          },
        ),
        SizedBox(width: 40.w),
        _buildRecordTypeOption(
          icon: Icons.file_copy,
          label: "Prescription",
          isSelected: selectedRecordType == "Prescription",
          onTap: () {
            setState(() {
              selectedRecordType = "Prescription";
            });
          },
        ),
        SizedBox(width: 40.w),
        _buildRecordTypeOption(
          icon: Icons.event_note_outlined,
          label: "Invoice",
          isSelected: selectedRecordType == "Invoice",
          onTap: () {
            setState(() {
              selectedRecordType = "Invoice";
            });
          },
        ),
      ],
    );
  }

  Widget _buildRecordTypeOption({
    required IconData icon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 40,
            color:
                isSelected
                    ? const Color.fromARGB(255, 22, 150, 111)
                    : Colors.grey,
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              color:
                  isSelected
                      ? const Color.fromARGB(255, 22, 150, 111)
                      : Colors.grey,
              fontSize: 20,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  void _showAddRecordBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Add a record",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 20.h),
              _buildBottomSheetOption(
                icon: Icons.camera_alt,
                label: "Take a photo",
                onTap: () {
                  Navigator.pop(context);
                  // Camera logic here
                },
              ),
              SizedBox(height: 15.h),
              _buildBottomSheetOption(
                icon: Icons.photo,
                label: "Upload from gallery",
                onTap: () {
                  Navigator.pop(context);
                  // Gallery logic here
                },
              ),
              SizedBox(height: 15.h),
              _buildBottomSheetOption(
                icon: Icons.file_upload,
                label: "Upload files",
                onTap: () {
                  // File picker logic here
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBottomSheetOption({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, color: Colors.black, size: 22.sp),
          SizedBox(width: 15.w),
          Text(
            label,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
