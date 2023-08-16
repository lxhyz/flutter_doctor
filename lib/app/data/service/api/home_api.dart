import 'dart:convert';

import 'package:doctor/app/data/model/home_doctors_hospital.dart';
import 'package:doctor/app/data/model/home_doctors_list_model.dart';
import 'package:get/get_connect/http/src/response/response.dart';

import '../http_service.dart';


class HomeApi {
   static Future<homeDoctorsListModel> queryDoctorsList() async {
     final response = await HttpService.get("/doctorsList");
     final decodeResponse = json.decode(response.toString()) as Map<String,dynamic>;
     final doctorsList = homeDoctorsListModel.fromJson(decodeResponse);
     return doctorsList;
   }

   static Future<homeDoctorHospitalModel> queryDoctorsAddressList() async {
     final response = await HttpService.get("/doctorHospital");
     final decodeResponse = json.decode(response.toString());
     final homeDoctorHospitalModel result = homeDoctorHospitalModel.fromJson(decodeResponse["data"]);
     return result;
   }
}