import 'package:doctor/app/data/Widgets/custom_text.dart';
import 'package:doctor/app/data/widgets/custom_bannner_item.dart';
import 'package:doctor/app/data/widgets/custom_smart_footer.dart';
import 'package:doctor/app/data/widgets/custom_smart_header.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../controllers/check_up_controller.dart';
import 'package:doctor/app/data/model/home_doctors_hospital.dart';

class CheckUpView extends GetView<CheckUpController> {
  const CheckUpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        actions: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                left: 10,
                right: 10,
                top: 15
              ),
              decoration: BoxDecoration(
                color: Color(0xffF6F8FE),
                borderRadius: BorderRadius.circular(24)
              ),
              child: TextField(
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20
                  ),
                  suffixIcon: Icon(Icons.format_align_center,color: Color(0xff171725),),
                ),
                textAlignVertical: TextAlignVertical.center,
              ),
            ),
          )
        ],
      ),
      body: SmartRefresher(
        controller: controller.refreshController,
        enablePullUp: true,
        enablePullDown: true,
        header:CustomHeader(
          builder: (BuildContext context,RefreshStatus? mode){
            return CustomSmartHeader(mode: mode!);
          },
        ),
        footer:CustomFooter(
          builder: (BuildContext context,LoadStatus? mode){
            return customSmartFooter(mode: mode!);
          },
        ),
        onRefresh: (){
          controller.downPullRefresh();
        },
        onLoading: (){
          controller.refreshLoad();
        },
        child: Container(
          padding: EdgeInsets.all(20),
          child: Obx(() {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ElevatedButton(
                  //   onPressed: (){
                  //     controller.getDoctorHospital();
                  //   },
                  //   child: Text("123"),
                  // ),
                  CustomText("Specialist  Services",textColor: Color(0xff171725),fontWeight: FontWeight.w700,fontSize: 18,),
                  SizedBox(height: 20,),
                  Container(
                    height: 220,
                    // color: Colors.orange,
                    child: GridView.count(
                      crossAxisCount: 4,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 0.85,
                      physics: NeverScrollableScrollPhysics(),
                      children:List.generate(controller.bannerList.length, (index) {
                        return CustomBannerItem(controller.bannerList[index].tabbarTitle,controller.bannerList[index].tabbarImage);
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 20,),
                  CustomText("Nearby Doctor",textColor: Color(0xff171725),fontWeight: FontWeight.w700,fontSize: 18,),
                  SizedBox(height: 20,),
                  ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      ...controller.doctorHospitalList.map((element) {
                        return _DoctorItem(element);
                      }).toList()
                    ],
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _DoctorItem(Info element){
    return GestureDetector(
      onTap: (){
        Get.toNamed("/doctor-detail");
      },
      child: Container(
        height: 100,
        margin: EdgeInsets.only(
          bottom: 20
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 88,
              height: 100,
              child: Stack(
                children: [
                  Container(
                    width: 88,
                    height: 88,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey.withOpacity(.5),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Image.network(element.avatar as String,fit: BoxFit.cover,),
                  ),
                  Positioned(
                    bottom: -5,
                    left: 44 - 27,
                    child: Container(
                      height: 30,
                      width: 88 / 2 + 10,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(.5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.star,color: Colors.orange,size: 14),
                          SizedBox(width: 2,),
                          CustomText(element.star.toString(),textColor: Colors.white,fontSize: 12,)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(width: 16,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomText(element.name as String,textColor: Color(0xff171725),fontSize: 16,fontWeight: FontWeight.w700,),
                CustomText(element.kind as String,textColor: Color(0xff78828A),fontSize: 12,fontWeight: FontWeight.w600,),
                Row(
                  children: [
                    Icon(Icons.room,color: Colors.black,),
                    SizedBox(width: 5,),
                    CustomText(element.address as String,textColor: Color(0xff434E58),fontSize: 12,fontWeight: FontWeight.w500,),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
