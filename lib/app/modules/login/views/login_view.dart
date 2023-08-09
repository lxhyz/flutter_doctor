import 'package:doctor/app/data/Widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff121942),
        iconTheme: IconThemeData(
          color: Colors.white
        ),
      ),
      body:  Obx((){
        return SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(
                    top: 30
                  ),
                  color: Color(0xff121942),
                  child: Column(
                    children: [
                      CustomText("Create account",fontSize: 24,fontWeight: FontWeight.w700,textColor: Color(0xffFEFEFE)),
                      SizedBox(height: 8),
                      CustomText("Lorem ipsum dolor sit amet",fontSize: 16,fontWeight: FontWeight.w500,textColor: Color(0xffFEFEFE)),
                    ],
                  ),
                ),
                Positioned(
                  top: 140,
                  left: 0,
                  child: SingleChildScrollView(
                    child: Container(
                      constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height,
                        minWidth: MediaQuery.of(context).size.width,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)
                        )
                      ),
                      padding: EdgeInsets.only(
                        top: 40,
                        bottom: 20,
                        left: 20,
                        right: 20
                      ),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText("Email",textColor: Color(0xff78828A),fontSize: 14,),
                            SizedBox(height: 20,),
                            // email input container
                            Container(
                              height: 52,
                              width: MediaQuery.of(context).size.width - 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                color: Color(0xffF6F8FE)
                              ),
                              child: Form(
                                key: controller.formKey,
                                child: TextFormField(
                                  controller: controller.editController,
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Enter you emial address",
                                    hintStyle: TextStyle(
                                      color: Color(0xff9CA4AB),
                                      fontSize: 16
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 20
                                    ),
                                  ),
                                  validator: (dynamic value) {
                                    if(value == null || value.toString().isEmpty) {
                                      return "please enter you email address";
                                    }
                                    if(! GetUtils.isEmail(value)) {
                                      return "Please check you email address";
                                    } 
                                    return null;
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: 20,),
                            ElevatedButton(
                              style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all<Size>(Size(MediaQuery.of(context).size.width - 40, 56)),
                                backgroundColor: MaterialStateProperty.all<Color>(Color(0xff121942)),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24)
                                  )
                                )
                              ),
                              child: CustomText("Continue with Email",fontSize: 16,fontWeight: FontWeight.w600,textColor: Colors.white,),
                              onPressed: (){
                                if(controller.formKey.currentState!.validate()){
                                  Get.toNamed("/login-enter");
                                }
                              }, 
                            ),
                            SizedBox(height: 30),
                            Container(
                              width: MediaQuery.of(context).size.width - 40,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 60,
                                    height: 1.5,
                                    child: Container(
                                      color: Color(0xff6C6C6C),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  CustomText("Or continue with",textColor: Color(0xff6C6C6C),fontSize: 14,fontWeight: FontWeight.w600,),
                                  SizedBox(width: 10),
                                  SizedBox(
                                    width: 60,
                                    height: 1.5,
                                    child: Container(
                                      color: Color(0xff6C6C6C),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 40),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.white),
                                minimumSize: MaterialStateProperty.all<Size>(Size(MediaQuery.of(context).size.width - 40, 56)),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24),
                                    side: BorderSide(width: 1,color: Colors.black)
                                  )
                                ),
                              ),
                              onPressed: (){
                              
                              }, 
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomText("Continue with Google",textColor: Color(0xff171725),fontSize: 16,fontWeight: FontWeight.w600,)
                                ],
                              )
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.white),
                                minimumSize: MaterialStateProperty.all<Size>(Size(MediaQuery.of(context).size.width - 40, 56)),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24),
                                    side: BorderSide(width: 1,color: Colors.black)
                                  )
                                ),
                              ),
                              onPressed: (){}, 
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomText("Continue with Apple ${controller.text}",textColor: Color(0xff171725),fontSize: 16,fontWeight: FontWeight.w600,)
                                ],
                              )
                            ),
                            SizedBox(height: 40),
                            Container(
                              width: MediaQuery.of(context).size.width - 40,
                              alignment: Alignment.center,
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Already have an acount?",
                                      style: TextStyle(
                                        color: Color(0xff6C6C6C),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600
                                      )
                                    ),
                                    TextSpan(
                                      text: "\ \ Login",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600
                                      )
                                    )
                                  ]
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
