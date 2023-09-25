import 'package:ekam/model/appointment_package.dart';
import 'package:ekam/model/doctor_detail.dart';
import 'package:ekam/utils/dio_client.dart';

class APIService {
  final DioClient client;

  APIService(this.client);

  Future<List<DoctorDetails>> getDoctorsDetails() async {
    var response = await client.get<List<dynamic>>(
        "https://my-json-server.typicode.com/githubforekam/doctor-appointment/doctors");
    if (response.statusCode == 200) {
      return response.data?.map((e) => DoctorDetails.fromJson(e)).toList() ??
          [];
    }
    return [];
  }

  Future<Package?> getPackageDetails() async {
    var response = await client.get<Map<String, dynamic>>(
        "https://my-json-server.typicode.com/githubforekam/doctor-appointment/appointment_options");
    if (response.statusCode != 200 || response.data == null) return null;
    return Package.fromJson(response.data!);
  }
}
