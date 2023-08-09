  import 'package:doctor/app/data/Widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

  CustomAppBar(String title,bool isShowBottom){
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
      bottom:isShowBottom ?  PreferredSize(
        preferredSize: Size.fromHeight(52),
        child: Container(
          width: Get.width,
          height: 52,
          margin: EdgeInsets.symmetric(
            horizontal: 20
          ),
          decoration: BoxDecoration(
            color: Color(0xffF6F8FE),
            borderRadius: BorderRadius.circular(24)
          ),
          child: TextField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search,color: Colors.grey,),
              suffixIcon: Icon(Icons.format_align_center,color: Colors.black,),
              hintText: "Search...",
              hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20
              ),
            ),
            textAlignVertical: TextAlignVertical.center,
          ),
        ),
      ) : null,
    );
  }