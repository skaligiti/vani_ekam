import 'package:ekam/model/doctor_detail.dart';
import 'package:ekam/utils/api_service.dart';
import 'package:ekam/utils/availability_utils.dart';
import 'package:ekam/utils/dio_client.dart';
import 'package:get/get.dart';

class DoctorDetailsPageController extends GetxController {
  final APIService _apiService = Get.put(APIService(DioClient.getInstance()));
  final DoctorDetails doctorDetails;

  late List<String> dates =
      AvailabilityUtils.getDatesFromAvailability(doctorDetails.availability!);

  RxList<DateTime> timeslots = <DateTime>[].obs;

  RxInt selectedDateIndex = (-1).obs;
  RxInt selectedTimeSlotIndex = 0.obs;

  DoctorDetailsPageController(this.doctorDetails);

  @override
  void onInit() {
    super.onInit();
    selectDateAtIndex(0);
  }

  void selectDateAtIndex(int index) {
    if (index == selectedDateIndex.value) return;
    selectedDateIndex.value = index;
    timeslots.value = AvailabilityUtils.getTimeFromDateOfAvailability(
      dates[selectedDateIndex.value],
      doctorDetails.availability![dates[selectedDateIndex.value]]!,
    );
    selectTimeSlotAtIndex(0);
  }

  void selectTimeSlotAtIndex(int index) {
    selectedTimeSlotIndex.value = index;
  }

  void makeAppointment() async {
    var package = await _apiService.getPackageDetails();
    if (package != null) {
      Get.toNamed("/selectPackage", arguments: {
        "doctorDetails": doctorDetails,
        "selectedTimeslot": timeslots[selectedTimeSlotIndex.value],
        "package": package,
      });
    }
  }
}
