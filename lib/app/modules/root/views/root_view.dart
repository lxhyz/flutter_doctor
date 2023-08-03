import 'package:doctor/app/data/Widgets/custom_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/root_controller.dart';

class RootView extends GetView<RootController> {
  const RootView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final userInfo = controller.box.read("userInfo");
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Center(
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20)
              ),
              child: FlutterLogo(),
            ),
          ),
        ),
        title:  Container(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText("How are you feeling today",fontSize: 18,fontWeight: FontWeight.w700,),
                SizedBox(height: 5,),
                CustomText("${userInfo['name']}",fontSize: 12,fontWeight: FontWeight.w600,textColor: Color(0xff78828A),)
              ],
            ),
        ),
        actions: [
          Icon(Icons.alarm,color: Colors.black,),
          SizedBox(width: 10,),
          Icon(Icons.message_outlined,color: Colors.black,),
          SizedBox(width: 10,),
        ],
        centerTitle: false,
        toolbarHeight: 60,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20
            ),
            child: Column(
              children: [
                Container(
                  height: 150,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xff171725)
                  ),
                  child: PageView(
                    children: [
                      ...controller.reservationList.map((element) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 93,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(
                                    left: 10
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText("Dr. Richar Kandowen",textColor: Colors.white,fontSize: 16,fontWeight: FontWeight.w600,),
                                      CustomText("Child Specialist",textColor: Colors.white,fontSize: 12,fontWeight: FontWeight.w500,),
                                      Row(
                                        children: [
                                          Icon(Icons.schedule_rounded,color: Colors.white,),
                                          SizedBox(width: 10,),
                                          CustomText("Today",textColor: Colors.white,fontSize: 12,fontWeight: FontWeight.w600,),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.alarm,color: Colors.white,),
                                          SizedBox(width: 10,),
                                          Expanded(
                                            child: CustomText("14:30 - 15:30 AM  ",textColor: Colors.white,fontSize: 12,fontWeight: FontWeight.w600,),
                                          ),
                                          Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(15),
                                              color: Colors.white,
                                            ),
                                            child: Icon(Icons.phone,color: Colors.black,),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      })
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
