import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginEnterController extends GetxController {

  final count = 0.obs;
  final openPassword = false.obs;
  final openReportPassword = false.obs;
  final TextEditingController passowrdController = TextEditingController();
  final TextEditingController reportPassowrdController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
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
