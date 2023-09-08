import 'dart:async';

import 'package:doctor/app/data/model/schedule_day_List.dart';
import 'package:doctor/app/data/service/api/schedule_api.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ScheduleController extends GetxController {
  final timeSeconds = Duration(seconds: 5);
  late Timer timers;
  final count = 0.obs;
  final swiperIndex = 0.obs;
  final checkButtonIndex = 0.obs;
  final selections = [true, false].obs;
  final scheduleList = [].obs;
  final queryScheduleStatus = 1.obs;
  final RefreshController refreshController = RefreshController();
  @override
  void onInit() {
    super.onInit();
    getScheduleListData(queryScheduleStatus.value);
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

  void getScheduleListData(int status) async {
    final scheduleDayList result = await ScheduleApi.getScheduleList("2021-12-12", "2021-12-12", status);
    scheduleList.value = result.scheduleList as List<ScheduleList>;
    scheduleList.refresh();
    refreshController.refreshCompleted(); // 重置刷新状态
  }

  void refreshLoadScheduleList() async {
    await Future.delayed(Duration(seconds: 3));
    refreshController.loadNoData();
  }
}
