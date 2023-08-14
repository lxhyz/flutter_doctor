import 'package:doctor/app/data/service/api/home_api.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  late GetStorage box;

  final reservationList = [
    {
      "name":"Dr. Richar Kandowen",
      "kind":"Child Specialist",
      "date":"Today",
      "time":"12:00 - 15:30 PM",
      "avatar":""
    },
    {
      "name":"Swift tale",
      "kind":"Child Specialist",
      "date":"Tomorrow",
      "time":"08:00 - 11:30 AM",
      "avatar":""
    }
  ].obs;
  final reservationIndex = 0.obs;
  @override
  void onInit() {
    super.onInit();
    box = GetStorage();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
