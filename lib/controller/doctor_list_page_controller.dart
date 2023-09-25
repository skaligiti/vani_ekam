import 'package:ekam/model/doctor_detail.dart';
import 'package:ekam/utils/api_service.dart';
import 'package:ekam/utils/dio_client.dart';
import 'package:get/get.dart';

class DoctorListPageController extends GetxController {

  RxList<DoctorDetails> doctors = <DoctorDetails>[].obs;
  RxBool doctorsFetched = false.obs;

  final APIService _apiService = Get.put(APIService(DioClient.getInstance()));

  @override
  void onInit() {
    super.onInit();
    fetchDoctorsList();
  }

  void fetchDoctorsList() async {
    var t = await _apiService.getDoctorsDetails();
    doctors.addAll(t);
    doctorsFetched.value = true;
  }

}