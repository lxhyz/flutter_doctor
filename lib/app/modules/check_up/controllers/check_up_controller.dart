import 'package:doctor/app/data/model/home_doctors_hospital.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../data/model/home_doctors_list_model.dart';
import '../../../data/service/api/home_api.dart';

class CheckUpController extends GetxController {
  final RefreshController refreshController = RefreshController();
  final refreshNumber = 0.obs;
  final bannerList = [].obs;
  final doctorHospitalList = [].obs;
  @override
  void onInit() {
    getSpecialList();
    getDoctorHospital();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getSpecialList() async {
    final homeDoctorsListModel result =  await HomeApi.queryDoctorsList();
    bannerList.value = result.data!.servicesList as List<ServicesList>;
  }

  void getDoctorHospital() async {
    final homeDoctorHospitalModel result  = await HomeApi.queryDoctorsAddressList();
    doctorHospitalList.value = result.info as List<Info>;
  }

  void refreshLoad() async {
    refreshNumber.value += 1;
    await Future.delayed(Duration(seconds: 3));
    if(refreshNumber == 3) {
      refreshController.loadNoData();
    }
    else if(refreshNumber == 2){
      refreshController.loadFailed();
    }
    else {
      refreshController.loadComplete();
    }
  }

  void downPullRefresh() async {
    refreshNumber.value += 1;
    await Future.delayed(Duration(seconds: 3));
    if(refreshNumber == 2){
      refreshController.refreshFailed();
    }
    else {
      refreshController.refreshCompleted();
    }
  }
}
