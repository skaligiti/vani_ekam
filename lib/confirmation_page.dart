import 'package:ekam/model/doctor_detail.dart';
import 'package:ekam/utils/date_time_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmationPage extends StatelessWidget {
  ConfirmationPage({super.key});

  final DoctorDetails doctorDetails = Get.arguments['doctorDetails'];
  final DateTime selectedTimeslot = Get.arguments['selectedTimeslot'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Confirmation"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
                color: Colors.blueAccent,
              ),
              padding: const EdgeInsets.all(10.0),
              child: const Icon(
                Icons.done_rounded,
                color: Colors.white,
                size: 80,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "Appointment confirmed",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            Text(
              "You have successfully booked appointment with ${doctorDetails.doctorName}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
            const Divider(),
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                    child: _buildRow(Icons.calendar_month_rounded,
                        selectedTimeslot.format("dd MMM, yyyy"))),
                Expanded(
                    child: _buildRow(
                        Icons.timer, selectedTimeslot.format("hh:mm a"))),
              ],
            ),
            const Spacer(),
            ElevatedButton(
                onPressed: () => Get.until((route) => Get.currentRoute == '/'),
                child: const Text("Book Another"))
          ],
        ),
      ),
    );
  }

  Widget _buildRow(IconData iconData, String text) {
    return Row(
      children: [
        Icon(
          iconData,
          size: 24,
          color: Colors.blueAccent,
        ),
        const SizedBox(width: 10),
        Text(text),
      ],
    );
  }
}
