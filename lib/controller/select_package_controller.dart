import 'package:ekam/model/appointment_package.dart';
import 'package:ekam/model/doctor_detail.dart';
import 'package:get/get.dart';

/*{
        "doctorDetails": doctorDetails,
        "selectedTimeslot": timeslots[selectedTimeSlotIndex.value],
        "package": package,
      }
      */

class SelectPackageController extends GetxController {
  SelectPackageController(
    this.doctorDetails,
    this.selectedTimeslot,
    this.appointmentPackage,
  );

  final DoctorDetails doctorDetails;
  final DateTime selectedTimeslot;
  final Package appointmentPackage;

  List<String> get packages => appointmentPackage.package ?? [];

  List<String> get durations => appointmentPackage.duration ?? [];

  late RxString selectedPackage = packages[0].obs;

  late RxString selectedDuration = durations[0].obs;

  void selectPackage(String package) {
    selectedPackage.value = package;
  }

  void selectDuration(String duration) {
    selectedDuration.value = duration;
  }

  void next() {
    Get.toNamed("/reviewSummary", arguments: {
      "doctorDetails": doctorDetails,
      "selectedTimeslot": selectedTimeslot,
      "duration": selectedDuration.value,
      "package": selectedPackage.value,
    });
  }
}
