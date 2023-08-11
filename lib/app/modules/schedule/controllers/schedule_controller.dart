import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ScheduleController extends GetxController {
  final timeSeconds = Duration(seconds: 5);
  late Timer timers;
  final count = 0.obs;
  final swiperIndex = 0.obs;
  final checkButtonIndex = 0.obs;
  final selections = [true, false].obs;
  @override
  void onInit() {
    super.onInit();

    timers = Timer.periodic(timeSeconds, (timer) {
      if(count >= 5){
        timers.cancel();
      }
      count.value = count.value + 1;
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    timers.cancel();
  }

}
