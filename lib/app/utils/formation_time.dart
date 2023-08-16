import 'package:intl/intl.dart';

class FormationTime {
  static String formationDateTime(int timeStamp) {
    var dateTime = DateTime.fromMillisecondsSinceEpoch(timeStamp);
    String formattedDateTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);
    return formattedDateTime;
  }
}