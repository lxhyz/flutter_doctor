import 'package:get_storage/get_storage.dart';

bool IsLogin(){
  final GetStorage box = GetStorage();
  var userInfo = box.read("userInfo");
  print("userInfo ----${userInfo}");
  print("name ----${userInfo["name"]}");
  var result = (userInfo["name"].toString().trim() != "" && userInfo["name"] != null) ? true : false;
  return result;
}