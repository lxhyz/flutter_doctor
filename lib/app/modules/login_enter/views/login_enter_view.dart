import 'package:doctor/app/data/Widgets/custom_text.dart';
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
                          child: TextField(
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
                              )
                            ),
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
                          child: TextField(
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
                          child: TextField(
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
                          child: TextField(
                            cursorColor: Colors.black,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter your password",
                              suffixIcon: Icon(Icons.remove_red_eye,color: Color(0xff9CA4AB),),
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
                          child: TextField(
                            cursorColor: Colors.black,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter your repeate password",
                              suffixIcon: Icon(Icons.remove_red_eye,color: Color(0xff9CA4AB),),
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
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      
                    ),
                    onPressed: (){}, 
                    child: CustomText("Sign up")
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
