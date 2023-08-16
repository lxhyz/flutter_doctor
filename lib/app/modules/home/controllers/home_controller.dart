import 'package:doctor/app/data/model/home_doctors_hospital.dart';
import 'package:doctor/app/data/service/api/home_api.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  late GetStorage box;

  final reservationIndex = 0.obs;
  final doctorsSwiper = [].obs;
  final servicesList = [].obs;
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
    print("hospital ----${doctorsAddressInfo}");
  }
}
