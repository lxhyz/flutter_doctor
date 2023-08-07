  import 'package:doctor/app/data/Widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

  CustomAppBar(String title){
    return AppBar(
      toolbarHeight: 70,
      leading: Center(
        child: GestureDetector(
          onTap: (){
            Get.back();
          },
          child: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Color(0xffececed)
            ),
            child: Icon(Icons.arrow_back),
          ),
        ),
      ),
      centerTitle: true,
      title: CustomText(title,fontSize: 18,fontWeight: FontWeight.w700,),
    );
  }