import 'package:ekam/controller/doctor_list_page_controller.dart';
import 'package:ekam/ui/doctor_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorListingPage extends StatelessWidget {
  DoctorListingPage({super.key});

  final _controller = Get.put(DoctorListPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Doctors"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Obx(
          () => !_controller.doctorsFetched.value
              ? const Center(
                  child: Text("Loading..."),
                )
              : _controller.doctors.isEmpty
                  ? const Center(
                      child: Text("No Doctors Available"),
                    )
                  : ListView.separated(
                      itemCount: _controller.doctors.length,
                      itemBuilder: (_, index) => GestureDetector(
                        onTap: () => Get.toNamed("/doctorDetails",
                            arguments: _controller.doctors[index]),
                        child: DoctorInfoWidget(
                            doctorDetails: _controller.doctors[index]),
                      ),
                      separatorBuilder: (_, __) => const Divider(),
                    ),
        ),
      ),
    );
  }
}
