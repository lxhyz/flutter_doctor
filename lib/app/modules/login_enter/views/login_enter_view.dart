import 'dart:convert';

import 'package:doctor/app/data/Widgets/custom_text.dart';
import 'package:doctor/app/data/model/login_model.dart';
import 'package:doctor/app/data/service/api/login_api.dart';
import 'package:doctor/app/data/service/http_service.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controllers/login_enter_controller.dart';

class LoginEnterView extends GetView<LoginEnterController> {
  LoginEnterView({Key? key}) : super(key: key);
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        leading: Center(
          child: Container(
            margin: EdgeInsets.only(
              left: 10,
            ),
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Color(0xffececed)
            ),
            child: GestureDetector(
              onTap: (){
                Get.back();
              },
              child: Icon(Icons.arrow_back,color: Colors.black,),
            ),
          ),
        ),
        title:  CustomText("Sign Up",fontSize: 18,fontWeight: FontWeight.w700,),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 30
            ),
            child: Obx(() {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${controller.count}"),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    child: CustomText("Complet your account",fontWeight: FontWeight.w700,fontSize: 24,),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    child: CustomText("Lorem ipsum dolor sit amet",fontWeight: FontWeight.w500,fontSize: 14,),
                  ),
                  SizedBox(height: 40,),
                  Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText("First Name",textColor: Color(0xff78828A),fontWeight: FontWeight.w500,fontSize: 14,),
                        SizedBox(height: 10,),
                        Container(
                          height: 52,
                          decoration: BoxDecoration(
                            color: Color(0xffF6F8FE),
                            borderRadius: BorderRadius.circular(24)
                          ),
                          child: TextFormField(
                            controller: controller.nameController,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter your first name",
                              hintStyle: TextStyle(
                                color: Color(0xff9CA4AB,),
                                fontSize: 16,
                                fontWeight: FontWeight.w500
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 20
                              ),
                            ),
                            validator: (value) {
                              if(value == null || value.toString().isEmpty) {
                                return "Enter you first name";
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 20,),
                        CustomText("Last Name",textColor: Color(0xff78828A),fontWeight: FontWeight.w500,fontSize: 14,),
                        SizedBox(height: 10,),
                        Container(
                          height: 52,
                          decoration: BoxDecoration(
                            color: Color(0xffF6F8FE),
                            borderRadius: BorderRadius.circular(24)
                          ),
                          child: TextFormField(
                            controller: controller.reportNameController,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter your last name",
                              hintStyle: TextStyle(
                                color: Color(0xff9CA4AB,),
                                fontSize: 16,
                                fontWeight: FontWeight.w500
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 20
                              )
                            ),
                            validator: (value) {
                              if(value == null || value.toString().isEmpty) {
                                return "Enter you last name";
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 20,),
                        CustomText("E-mail",textColor: Color(0xff78828A),fontWeight: FontWeight.w500,fontSize: 14,),
                        SizedBox(height: 10,),
                        Container(
                          height: 52,
                          decoration: BoxDecoration(
                            color: Color(0xffF6F8FE),
                            borderRadius: BorderRadius.circular(24)
                          ),
                          child: TextFormField(
                            controller: controller.emialController,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter your email",
                              hintStyle: TextStyle(
                                color: Color(0xff9CA4AB,),
                                fontSize: 16,
                                fontWeight: FontWeight.w500
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 20
                              )
                            ),
                            validator: (value) {
                              if(value == null || value.toString().isEmpty) {
                                return "Enter you first name";
                              }
                              if(! GetUtils.isEmail(value)) {
                                return "you email addres is error";
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 20,),
                        CustomText("Password",textColor: Color(0xff78828A),fontWeight: FontWeight.w500,fontSize: 14,),
                        SizedBox(height: 10,),
                        Container(
                          height: 52,
                          decoration: BoxDecoration(
                            color: Color(0xffF6F8FE),
                            borderRadius: BorderRadius.circular(24)
                          ),
                          child: TextFormField(
                            controller: controller.passowrdController,
                            cursorColor: Colors.black,
                            obscureText: !controller.openPassword.value,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter your password",
                              suffixIcon: GestureDetector(
                                onTap: (){
                                  controller.openPassword.value = !controller.openPassword.value;
                                },
                                child: Icon(controller.openPassword.value ? Icons.visibility_off : Icons.remove_red_eye ,color: Color(0xff9CA4AB),),
                              ),
                              hintStyle: TextStyle(
                                color: Color(0xff9CA4AB,),
                                fontSize: 16,
                                fontWeight: FontWeight.w500
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 20
                              )
                            ),
                            textAlignVertical: TextAlignVertical.center,
                            validator: (value) {
                              if(value == null || value.toString().isEmpty) {
                                return "enter you password";
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 20,),
                        CustomText("Password",textColor: Color(0xff78828A),fontWeight: FontWeight.w500,fontSize: 14,),
                        SizedBox(height: 10,),
                        Container(
                          height: 52,
                          decoration: BoxDecoration(
                            color: Color(0xffF6F8FE),
                            borderRadius: BorderRadius.circular(24)
                          ),
                          child: TextFormField(
                            controller: controller.reportPassowrdController,
                            cursorColor: Colors.black,
                            obscureText: !controller.openReportPassword.value,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter your report password",
                              suffixIcon: GestureDetector(
                                onTap: (){
                                  controller.openReportPassword.value = !controller.openReportPassword.value;
                                },
                                child: Icon(controller.openReportPassword.value ? Icons.visibility_off : Icons.remove_red_eye ,color: Color(0xff9CA4AB),),
                              ),
                              hintStyle: TextStyle(
                                color: Color(0xff9CA4AB,),
                                fontSize: 16,
                                fontWeight: FontWeight.w500
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 20
                              )
                            ),
                            textAlignVertical: TextAlignVertical.center,
                             validator: (value) {
                              if(value == null || value.toString().isEmpty) {
                                return "enter you password";
                              }
                              if(controller.passowrdController.text != controller.reportPassowrdController.text) {
                                return "the password is dont different";
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30,),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Color(0xff121942)),
                      minimumSize: MaterialStateProperty.all<Size>(Size(MediaQuery.of(context).size.width, 56)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24)
                        )
                      )
                    ),
                    onPressed: () async {
                      if(controller.formKey.currentState!.validate()) {
                        final LoginModel res =  await LoginApi.login(
                            controller.emialController.text,
                            controller.reportPassowrdController.text,
                            controller.nameController.text
                        );
                        var userInfo = {
                          "name":res.data?.userInfo?.userName,
                          "avatar":res.data?.userInfo?.avator,
                          "email":res.data?.userInfo?.email,
                          "token":res.data?.userInfo?.token,
                        };
                        await box.write("userInfo", userInfo);
                        HttpService.setHeaderKey((res.data?.userInfo?.token).toString());
                        Get.offAllNamed("/root");
                      }
                    }, 
                    child: CustomText("Sign up",textColor: Colors.white,fontSize: 16,fontWeight: FontWeight.w600,)
                  ),
                  SizedBox(height: 30,),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Already have an account?",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff66707A)
                            )
                          ),
                          TextSpan(
                            text: " Login",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff121942)
                            )
                          ),
                        ]
                      ),
                    ),
                  )
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
