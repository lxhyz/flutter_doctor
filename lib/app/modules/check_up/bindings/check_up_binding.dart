import 'package:get/get.dart';

import '../controllers/check_up_controller.dart';

class CheckUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckUpController>(
      () => CheckUpController(),
    );
  }
}
