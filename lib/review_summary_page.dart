import 'package:ekam/model/doctor_detail.dart';
import 'package:ekam/ui/doctor_info_widget.dart';
import 'package:ekam/utils/date_time_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewSummaryPage extends StatelessWidget {
  ReviewSummaryPage({super.key});

  final DoctorDetails doctorDetails = Get.arguments['doctorDetails'];
  final DateTime selectedTimeslot = Get.arguments['selectedTimeslot'];
  final String duration = Get.arguments['duration'];
  final String package = Get.arguments['package'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Review Summary"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DoctorInfoWidget(doctorDetails: doctorDetails),
            const Divider(),
            Column(
              children: [
                _buildRow("Date & Hour",
                    selectedTimeslot.format("MMM dd, yyyy | hh:mm a")),
                _buildRow("Package", package),
                _buildRow("Duration", duration),
                _buildRow("Booking for", "Self"),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () => Get.toNamed("/confirmation", arguments: {
                "doctorDetails": doctorDetails,
                "selectedTimeslot": selectedTimeslot,
              }),
              child: const Text("Confirm"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String primary, String secondary) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            primary,
            style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
                fontWeight: FontWeight.w600),
          ),
          const Spacer(),
          Text(
            secondary,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
