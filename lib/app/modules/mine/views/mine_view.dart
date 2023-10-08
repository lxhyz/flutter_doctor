import 'package:doctor/app/data/Widgets/custom_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/mine_controller.dart';

class MineView extends GetView<MineController> {
  const MineView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var userInfo = controller.box.read("userInfo");
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // userInfo_container
              Container(
                height: 56,
                child: Row(
                  children: [
                    Container(
                      height: 56,
                      width: 56,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        color: Colors.grey.withOpacity(.5)
                      ),
                      child: Image.network("${userInfo['avatar']}",fit: BoxFit.contain,),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      child: Column(
                        mainAxisAlignment:MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            CustomText("${userInfo['name'] ?? 'anonymous'}",fontWeight: FontWeight.w600,fontSize: 18,),
                            CustomText("${userInfo['email'] ?? ''}",fontWeight: FontWeight.w600,fontSize: 14,textColor: Color(0xff6C6C6C),),
                        ],
                      ),
                    ),
                    Center(
                      child: Icon(Icons.edit),
                    ),
                    SizedBox(width: 10,),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              // card_container
              Container(
                height: 109,
                decoration: BoxDecoration(
                  color: Color(0xff171725),
                  borderRadius: BorderRadius.circular(16)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText("Weight",textColor: Colors.white,fontSize: 10,fontWeight: FontWeight.w500,),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText("89",textColor: Colors.white,fontSize: 24,fontWeight: FontWeight.w700,),
                              SizedBox(width: 5,),
                              CustomText("Kg",textColor: Colors.white,fontSize: 10,fontWeight: FontWeight.w500,),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 30,
                      color: Colors.grey,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText("Height",textColor: Colors.white,fontSize: 10,fontWeight: FontWeight.w500,),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText("169",textColor: Colors.white,fontSize: 24,fontWeight: FontWeight.w700,),
                              SizedBox(width: 5,),
                              CustomText("Cm",textColor: Colors.white,fontSize: 10,fontWeight: FontWeight.w500,),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 30,
                      color: Colors.grey,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText("Age",textColor: Colors.white,fontSize: 10,fontWeight: FontWeight.w500,),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomText("24",textColor: Colors.white,fontSize: 24,fontWeight: FontWeight.w700,),
                              SizedBox(width: 5,),
                              CustomText("Years",textColor: Colors.white,fontSize: 10,fontWeight: FontWeight.w500,),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              // personInfo_title
              CustomText("PersonInfo"),
              SizedBox(height: 20,),
              // personInfo_container
              Container(
                child: Column(
                  children: List.generate(3, (index) {
                    return ListTile(
                      leading: Icon(Icons.shopping_bag_outlined),
                      title: Container(
                        alignment: Alignment.centerLeft,
                        child: CustomText("My Order",fontWeight: FontWeight.w600,fontSize: 16,),
                      ),
                      trailing: Icon(Icons.keyboard_arrow_right,size: 30,),
                    );
                  }),
                ),
              ),
              SizedBox(height: 20,),
              // personInfo_title
              CustomText("PersonInfo"),
              SizedBox(height: 20,),
              // personInfo_container
              Container(
                child: Column(
                  children: List.generate(3, (index) {
                    return ListTile(
                      leading: Icon(Icons.shopping_bag_outlined),
                      title: Container(
                        alignment: Alignment.centerLeft,
                        child: CustomText("My Order",fontWeight: FontWeight.w600,fontSize: 16,),
                      ),
                      trailing: Icon(Icons.keyboard_arrow_right,size: 30,),
                      onTap: (){
                        Get.toNamed("/order-list");
                      },
                    );
                  }),
                ),
              ),
              SizedBox(height: 20,),
              // Log_out container
              Container(
                width: MediaQuery.of(context).size.width,
                height: 62,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                        side: BorderSide(width: 1,color: Colors.black)
                      )
                    ),
                  ),
                  onPressed: (){
                    controller.box.write("userInfo", {"name":"","token":"","avatar":""});
                    Get.offAllNamed("/login");
                  },
                  child:CustomText("Log out",fontSize: 16,fontWeight: FontWeight.w500,)
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
