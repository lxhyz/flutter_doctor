

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Storage extends GetxService{
  late GetStorage box;

  init() async {
    box = GetStorage();
    await box.writeIfNull("userInfo", {"name":"","token":"","avatar":""});
    return this;
  }

  read(String key){
    return box.read(key);
  }

  void write(String key,dynamic value) async {
    await box.write(key, value);
  }
}