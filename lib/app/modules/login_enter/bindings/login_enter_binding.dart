import 'package:get/get.dart';

import '../controllers/login_enter_controller.dart';

class LoginEnterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginEnterController>(
      () => LoginEnterController(),
    );
  }
}
