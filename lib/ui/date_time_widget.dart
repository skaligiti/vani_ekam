import 'package:ekam/utils/availability_utils.dart';
import 'package:flutter/material.dart';
import 'package:ekam/utils/date_time_utils.dart';

class AvailableTimeWidget extends StatelessWidget {
  const AvailableTimeWidget({
    super.key,
    required this.selected,
    required this.time,
    required this.onClick,
  });

  final bool selected;
  final String time;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 15.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(21.0),
            color: selected ? Colors.blueAccent : null,
            border: selected ? null : Border.all(color: Colors.black38)),
        child: Text(
          time,
          style: TextStyle(
            color: selected ? Colors.white : Colors.black,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}

class AvailableDateWidget extends StatelessWidget {
  const AvailableDateWidget({
    super.key,
    required this.selected,
    required this.date,
    required this.onClick,
  });

  final bool selected;
  final String date;
  final VoidCallback onClick;

  DateTime get dateTime => date.parseDate(AvailabilityUtils.dateFormat);

  String get day =>
      dateTime.isSameDayAsToday ? "Today" : dateTime.weekdayString;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 9.0, horizontal: 20.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(21.0),
            color: selected ? Colors.blueAccent : null,
            border: selected ? null : Border.all(color: Colors.black38)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              day,
              style: TextStyle(
                color: (selected ? Colors.white : Colors.black).withOpacity(.7),
                fontSize: 9.0,
              ),
            ),
            Text(
              dateTime.format("dd MMM"),
              style: TextStyle(
                color: selected ? Colors.white : Colors.black,
                fontSize: 14.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
