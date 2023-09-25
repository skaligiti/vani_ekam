import 'date_time_utils.dart';

class AvailabilityUtils {
  _(){}

  static const dateFormat = "yyyy-MM-dd";
  static const timeFormat = "hh:mm a";

  static List<String> getDatesFromAvailability(Map<String, List<String>> availability) {
    return availability.keys.where((element) => availability[element]!.isNotEmpty).toList();
    //.parseDate(dateFormat)
  }

  static List<DateTime> getTimeFromDateOfAvailability(String date, List<String> timeslots) {
    List<DateTime> t = [];
    for (var timeslot in timeslots) {
      var toFrom = timeslot.split(' - ');
      var from = "$date ${toFrom[0]}".parseDate("$dateFormat $timeFormat");
      var to = "$date ${toFrom[1]}".parseDate("$dateFormat $timeFormat");
      while(from.isBefore(to)) {
        var temp = from.add(const Duration(minutes: 30));
        if(!temp.isAfter(to)) t.add(from);
        from = temp;
      }
    }
    return t;
  }
}