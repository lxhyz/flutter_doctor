import 'package:doctor/app/data/model/home_doctors_hospital.dart';
import 'package:doctor/app/data/service/api/home_api.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeController extends GetxController {
  late GetStorage box;

  final reservationIndex = 0.obs;
  final doctorsSwiper = [].obs;
  final servicesList = [].obs;
  final doctorHospitalList = [].obs;
  final refreshNum = 1.obs;
  final refreshController = RefreshController(initialRefresh: false);
  @override
  void onInit() async {
    super.onInit();
    box = GetStorage();
    getDoctorsInfo();
    getDoctorsAddressInfo();

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getDoctorsInfo() async {
    var doctorsList = await HomeApi.queryDoctorsList();
    doctorsSwiper.addAll((doctorsList.data?.doctors) as List);
    servicesList.addAll((doctorsList.data?.servicesList) as List);
  }

  void getDoctorsAddressInfo() async {
    final homeDoctorHospitalModel doctorsAddressInfo = await HomeApi.queryDoctorsAddressList();
    doctorHospitalList.addAll(doctorsAddressInfo.info as List);
    print("hospital ----${doctorsAddressInfo.info}");
  }

  void refreshLoad() async {
    refreshNum.value = refreshNum.value + 1;
    print("onloading");
    refreshController.refreshCompleted();
    await Future.delayed(Duration(milliseconds: 3000));
    getDoctorsAddressInfo();
    print("refreshNum ---------$refreshNum");
    if(refreshNum < 3) {
      refreshController.loadComplete();
    } else {
      refreshController.loadNoData();
    }
    print("complate");
  }
}
