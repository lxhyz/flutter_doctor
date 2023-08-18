import 'package:doctor/app/data/model/home_doctors_list_model.dart';
import 'package:doctor/app/data/service/api/home_api.dart';
import 'package:doctor/app/data/widgets/custom_bannner_item.dart';
import 'package:doctor/app/data/widgets/custom_card.dart';
import 'package:doctor/app/utils/formation_time.dart';
import 'package:doctor/app/utils/isLogin.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:url_launcher/url_launcher.dart';

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
              clipBehavior: Clip.hardEdge,
              child: Image.network("${userInfo['avatar']}",fit: BoxFit.contain,),
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
          GestureDetector(
            onTap: () async {
              if(IsLogin()) {
                Get.toNamed("/notification");
              } else {
                Get.toNamed("/login");
              }
            },
            child: Icon(Icons.alarm,color: Colors.black,),
          ),
          SizedBox(width: 10,),
          GestureDetector(
            onTap: (){
              if(IsLogin()) {
                Get.toNamed("/message");
              } else {
                Get.toNamed("/login");
              }
            },
            child: Icon(Icons.message_outlined,color: Colors.black,)
          ),
          SizedBox(width: 10,),
        ],
        centerTitle: false,
        toolbarHeight: 60,
      ),
      body: SmartRefresher(
        enablePullUp: true,
        enablePullDown: false,
        controller: controller.refreshController,
        onLoading: controller.refreshLoad,
        footer:CustomFooter(
          builder: (BuildContext context,LoadStatus? mode){
            print("mode -----${mode}");
            Widget body;
            if(mode==LoadStatus.idle){
              body =  Text("上拉加载");
            }
            else if(mode==LoadStatus.loading){
              body =  Text("加载中");
            }
            else if(mode == LoadStatus.failed){
              body = Text("加载失败！点击重试！");
            }
            else if(mode == LoadStatus.canLoading){
              body = Text("松手,加载更多!");
            }
            else{
              body = Text("没有更多数据了!");
            }
            return Container(
              height: 55.0,
              child: Center(child:body),
            );
          },
        ),
        child: SingleChildScrollView(
          child: Obx(() {
            return Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      controller.getDoctorsAddressInfo();
                    },
                    child: Text("123"),
                  ),
                  Container(
                    height: 150,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xff171725)
                    ),
                    child: PageView(
                      children: [
                        ...controller.doctorsSwiper.map((element) {
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
                                  clipBehavior: Clip.hardEdge,
                                  child: Image.network(element.image,fit: BoxFit.contain,),
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
                                        CustomText(element.name,textColor: Colors.white,fontSize: 16,fontWeight: FontWeight.w600,),
                                        CustomText(element.kind,textColor: Colors.white,fontSize: 12,fontWeight: FontWeight.w500,),
                                        Row(
                                          children: [
                                            Icon(Icons.schedule_rounded,color: Colors.white,),
                                            SizedBox(width: 10,),
                                            CustomText(element.day,textColor: Colors.white,fontSize: 12,fontWeight: FontWeight.w600,),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.alarm,color: Colors.white,),
                                                SizedBox(width: 10,),
                                                CustomText(FormationTime.formationDateTime(element.time),textColor: Colors.white,fontSize: 12,fontWeight: FontWeight.w600,),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () async {
                                                await launchUrl(Uri(scheme: 'tel',path:(element.mobile).toString(),host:'+86'));
                                              },
                                              child: Container(
                                                width: 30,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(15),
                                                  color: Colors.white,
                                                ),
                                                child: Icon(Icons.phone,color: Colors.black,),
                                              ),
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
                    children: controller.doctorsSwiper.map((element) {
                      var index = controller.doctorsSwiper.indexOf(element);
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
                    height: (controller.servicesList.length / 4).round() * 110,
                    child: GridView.count(
                      crossAxisCount: 4,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 0.85,
                      physics: NeverScrollableScrollPhysics(),
                      children:List.generate(controller.servicesList.length, (index) {
                        return CustomBannerItem(controller.servicesList[index].tabbarTitle,controller.servicesList[index].tabbarImage);
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 20,),
                  CustomText("Specialist  Services",textColor: Color(0xff171725),fontWeight: FontWeight.w700,fontSize: 18,),
                  SizedBox(height: 20,),
                  Container(
                    height: (controller.servicesList.length / 4).round() * 110,
                    // color: Colors.orange,
                    child: GridView.count(
                      crossAxisCount: 4,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 0.85,
                      physics: NeverScrollableScrollPhysics(),
                      children:List.generate(controller.servicesList.length, (index) {
                        return CustomBannerItem(controller.servicesList[index].tabbarTitle,controller.servicesList[index].tabbarImage);
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
                      children: controller.doctorHospitalList.map((element) {
                        return CustomCard(
                          element.name,
                          element.kind,
                          element.address,
                          element.star,
                          element.avatar,
                        );
                      }).toList()
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
