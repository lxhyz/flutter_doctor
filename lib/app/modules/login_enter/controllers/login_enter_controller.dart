import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginEnterController extends GetxController {

  final count = 0.obs;
  final openPassword = false.obs;
  final openReportPassword = false.obs;
  final TextEditingController passowrdController = TextEditingController(text: "123");
  final TextEditingController reportPassowrdController = TextEditingController(text:"123");
  final TextEditingController nameController = TextEditingController(text: "li");
  final TextEditingController reportNameController = TextEditingController(text:"li");
  final TextEditingController emialController = TextEditingController(text: "zt2l9999@163.com");
  final formKey = GlobalKey<FormState>();
  @override
  void onInit() {
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

  void increment() => count.value++;
}
