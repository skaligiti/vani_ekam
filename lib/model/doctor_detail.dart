class DoctorDetails {
  late String doctorName;
  String? image;
  late String speciality;
  late String location;
  int? patientsServed;
  int? yearsOfExperience;
  double? rating;
  int? numberOfReviews;
  Map<String, List<String>>? availability;

  DoctorDetails({
    required this.doctorName,
    this.image,
    required this.speciality,
    required this.location,
    this.patientsServed,
    this.yearsOfExperience,
    this.rating,
    this.numberOfReviews,
    this.availability,
  });

  DoctorDetails.fromJson(Map<String, dynamic> json) {
    doctorName = json['doctor_name'];
    image = json['image'];
    speciality = json['speciality'];
    location = json['location'];
    patientsServed = json['patients_served'];
    yearsOfExperience = json['years_of_experience'];
    rating = json['rating'];
    numberOfReviews = json['number_of_reviews'];
    Map<String, dynamic> availability =
        json['availability'] ?? {};
    this.availability = availability.map((key, value) => MapEntry(key, value?.cast<String>()));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['doctor_name'] = doctorName;
    data['image'] = image;
    data['speciality'] = speciality;
    data['location'] = location;
    data['patients_served'] = patientsServed;
    data['years_of_experience'] = yearsOfExperience;
    data['rating'] = rating;
    data['number_of_reviews'] = numberOfReviews;
    data['availability'] = availability;
    return data;
  }
}
