import 'package:doctor/app/data/model/schedule_day_List.dart';
import 'package:doctor/app/data/service/http_service.dart';
import 'dart:convert';

class ScheduleApi {
  static Future<scheduleDayList> getScheduleList(String startDate,String endDate,int status) async {
    final response = await HttpService.get("/queryScheduleList",queryParams: {"startDate":startDate,"endDate":endDate,"status":status});
    final decodeResponse = json.decode(response.toString());
    final scheduleDayList result = scheduleDayList.fromJson(decodeResponse['data']);
    return result;
  }
}
