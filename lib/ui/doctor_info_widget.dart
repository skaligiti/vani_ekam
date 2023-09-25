import 'package:flutter/material.dart';

import '../model/doctor_detail.dart';

class DoctorInfoWidget extends StatelessWidget {
  const DoctorInfoWidget({super.key, required this.doctorDetails});

  final DoctorDetails doctorDetails;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 50,
          child: doctorDetails.image != null
              ? ClipOval(
            child: Image.network(
              doctorDetails.image!,
              width: 100,
            ),
          )
              : null,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                doctorDetails.doctorName,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                doctorDetails.speciality,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black38,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                doctorDetails.location,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black38,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
