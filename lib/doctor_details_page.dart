import 'package:ekam/controller/doctor_details_page_controller.dart';
import 'package:ekam/ui/date_time_widget.dart';
import 'package:ekam/ui/doctor_info_widget.dart';
import 'package:ekam/utils/date_time_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorDetailsPage extends StatelessWidget {
  DoctorDetailsPage({super.key});

  final _controller = Get.put(DoctorDetailsPageController(Get.arguments));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Doctor Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child:
            CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DoctorInfoWidget(doctorDetails: _controller.doctorDetails),
                const Divider(),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Temp(
                        iconData: Icons.group,
                        primaryText:
                            "${_controller.doctorDetails.patientsServed ?? 0}",
                        secondaryText: "Patients",
                      ),
                    ),
                    Expanded(
                      child: Temp(
                        iconData: Icons.business_center,
                        primaryText:
                            "${_controller.doctorDetails.yearsOfExperience ?? 0}",
                        secondaryText: "Years Exp.",
                      ),
                    ),
                    Expanded(
                      child: Temp(
                        iconData: Icons.star_rounded,
                        primaryText: "${_controller.doctorDetails.rating ?? 0}",
                        secondaryText: "Rating",
                      ),
                    ),
                    Expanded(
                      child: Temp(
                        iconData: Icons.messenger_rounded,
                        primaryText:
                            "${_controller.doctorDetails.numberOfReviews ?? 0}",
                        secondaryText: "Review",
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  "Book Appointment".toUpperCase(),
                  style:
                      const TextStyle(letterSpacing: .8, color: Colors.black45),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Day",
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                Obx(() => _buildAvailableDateListView(
                    _controller.selectedDateIndex.value)),
                const SizedBox(height: 20),
                const Text(
                  "Time",
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                Obx(
                  () => _buildAvailableTimeslotsFromDateSelected(
                    _controller.selectedTimeSlotIndex.value,
                    _controller.timeslots,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(onPressed: () => _controller.makeAppointment(), child: Text("Make Appointment")),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget _buildAvailableDateListView(int selectedindex) {
    return SizedBox(
      height: 47,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) => AvailableDateWidget(
                selected: index == selectedindex,
                date: _controller.dates[index],
                onClick: () => _controller.selectDateAtIndex(index),
              ),
          separatorBuilder: (_, __) => const SizedBox(width: 10),
          itemCount: _controller.dates.length),
    );
  }

  Widget _buildAvailableTimeslotsFromDateSelected(
      int selectedIndex, List<DateTime> timeslots) {
    return SizedBox(
      height: 47,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) => AvailableTimeWidget(
                selected: index == selectedIndex,
                time: timeslots[index].format("hh:mm a"),
                onClick: () => _controller.selectTimeSlotAtIndex(index),
              ),
          separatorBuilder: (_, __) => const SizedBox(width: 10),
          itemCount: timeslots.length),
    );
  }
}

class Temp extends StatelessWidget {
  const Temp({
    super.key,
    required this.iconData,
    required this.primaryText,
    required this.secondaryText,
  });

  final IconData iconData;
  final String primaryText;
  final String secondaryText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.blueAccent.withOpacity(.2),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                iconData,
                color: Colors.blueAccent,
                size: 24,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            primaryText,
            style: const TextStyle(
                fontSize: 18.0,
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold),
          ),
          Text(
            secondaryText,
            style: const TextStyle(fontSize: 12.0, color: Colors.black38),
          )
        ],
      ),
    );
  }
}
