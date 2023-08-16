import 'dart:convert';

import 'package:doctor/app/data/model/login_model.dart';

import '../http_service.dart';


class LoginApi {
  static Future<LoginModel> login(String email,String password,String userName) async {
    final response = await HttpService.post("/doctor_login",data: {"email":email,"password":password,"userName":userName});
    final encodeResponse = json.decode(response.toString()) as Map<String, dynamic>;
    final LoginModel result = LoginModel.fromJson(encodeResponse);
    print("123-${result}");
    return result;
  }
}