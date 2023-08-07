import 'package:get/get.dart';

import '../controllers/doctor_detail_controller.dart';

class DoctorDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DoctorDetailController>(
      () => DoctorDetailController(),
    );
  }
}
