import 'package:doctor/app/data/widgets/custom_bannner_item.dart';
import 'package:doctor/app/data/widgets/custom_card.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/Widgets/custom_text.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
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
      body: SingleChildScrollView(
        child: Obx(() {
          return Container(
            padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    onPageChanged: (int index){
                      controller.reservationIndex.value = index;
                    },
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: controller.reservationList.map((element) {
                    var index = controller.reservationList.indexOf(element);
                    return Container(
                      height: 8,
                      width:controller.reservationIndex.value == index ? 24 : 8,
                      margin: EdgeInsets.only(
                          left: 10
                      ),
                      decoration: BoxDecoration(
                          color: Color(controller.reservationIndex.value == index ? 0xff121942  : 0xffE2E2E2),
                          borderRadius: BorderRadius.circular(4)
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20,),
                CustomText("Specialist  Services",textColor: Color(0xff171725),fontWeight: FontWeight.w700,fontSize: 18,),
                SizedBox(height: 20,),
                Container(
                  height: 200,
                  // color: Colors.orange,
                  child: GridView.count(
                    crossAxisCount: 4,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.85,
                    physics: NeverScrollableScrollPhysics(),
                    children:List.generate(8, (index) {
                      return CustomBannerItem("123","123");
                    }).toList(),
                  ),
                ),
                SizedBox(height: 20,),
                CustomText("Specialist  Services",textColor: Color(0xff171725),fontWeight: FontWeight.w700,fontSize: 18,),
                SizedBox(height: 20,),
                Container(
                  height: 100,
                  // color: Colors.orange,
                  child: GridView.count(
                    crossAxisCount: 4,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.85,
                    physics: NeverScrollableScrollPhysics(),
                    children:List.generate(4, (index) {
                      return CustomBannerItem("123","123");
                    }).toList(),
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText("Nearby Doctor",textColor: Color(0xff171725),fontWeight: FontWeight.w700,fontSize: 18,),
                    CustomText("See All",textColor: Color(0xff121942),fontWeight: FontWeight.w500,fontSize: 14,),
                  ],
                ),
                Column(
                  children: List.generate(2, (index){
                    return CustomCard();
                  }).toList(),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
