import '../http_service.dart';


class HomeApi {
   static Future<dynamic> login(String email,String password,String userName) async {
     return await HttpService.post("/doctor_login",data: {email,password,userName});
   }
}