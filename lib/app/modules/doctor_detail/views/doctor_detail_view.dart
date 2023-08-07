import 'package:doctor/app/data/Widgets/custom_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/doctor_detail_controller.dart';

class DoctorDetailView extends GetView<DoctorDetailController> {
  const DoctorDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        leading: Center(
          child: GestureDetector(
            onTap: (){
              Get.back();
            },
            child: Container(
              width: 48,
              height: 48,
              margin: EdgeInsets.only(
                left: 10
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Colors.grey.withOpacity(.4)
              ),
              child: Icon(Icons.arrow_back_sharp,color: Colors.black,),
            ),
          ),
        ),
        title: CustomText("Detail Doctor"),
        centerTitle: true,
      ),
      body: CustomScrollView(
        physics: NeverScrollableScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              height: MediaQuery.of(context).size.height - 160,
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 176,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 154,
                            height: 176,
                            child: Stack(
                              children: [
                                Container(
                                  width: 154,
                                  height: 154,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(12)
                                  ),
                                ),
                                Positioned(
                                  bottom: 10,
                                  left: 72.5 - 32.5,
                                  child: Container(
                                    width: 65,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.black.withOpacity(.7)
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.star,color: Colors.orange,size: 14),
                                        SizedBox(width: 4,),
                                        CustomText("4.0",textColor: Colors.white,fontSize: 12,)
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(width: 16,),
                          Container(
                            padding: EdgeInsets.only(
                                bottom: 10
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText("Dr. Emmly Lestiryno",textColor: Color(0xff171725),fontSize: 16,fontWeight: FontWeight.w700,),
                                CustomText("General Practitioner",textColor: Color(0xff78828A),fontSize: 12,fontWeight: FontWeight.w600,),
                                Row(
                                  children: [
                                    Icon(Icons.room,color: Colors.black,),
                                    SizedBox(width: 5,),
                                    CustomText("Elnodore Hospital",textColor: Color(0xff434E58),fontSize: 12,fontWeight: FontWeight.w500,),
                                  ],
                                ),
                                Row(
                                  children: List.generate(3, (index) {
                                    return Container(
                                      width: 40,
                                      height: 40,
                                      margin: EdgeInsets.only(
                                          right: 12
                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12),
                                          color: Color(0xffECF1F6)
                                      ),
                                      child: GestureDetector(
                                        onTap: (){

                                        },
                                        child: Icon(Icons.phone,color: Colors.greenAccent,),
                                      ),
                                    );
                                  }),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment:MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText("Patients",fontSize: 14,fontWeight: FontWeight.w500,textColor: Color(0xff9CA4AB),),
                                CustomText("Patients",fontSize: 16,fontWeight: FontWeight.w700,textColor: Color(0xff121942),),
                              ],
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 1,
                            color: Color(0xff9CA4AB),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment:MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText("Experience",fontSize: 14,fontWeight: FontWeight.w500,textColor: Color(0xff9CA4AB),),
                                CustomText("3 Years",fontSize: 16,fontWeight: FontWeight.w700,textColor: Color(0xff121942),),
                              ],
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 1,
                            color: Color(0xff9CA4AB),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment:MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText("Rate",fontSize: 14,fontWeight: FontWeight.w500,textColor: Color(0xff9CA4AB),),
                                CustomText("4.0",fontSize: 16,fontWeight: FontWeight.w700,textColor: Color(0xff121942),),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    CustomText("Description",fontWeight: FontWeight.w700,textColor: Color(0xff171725),fontSize: 16,),
                    SizedBox(height: 20,),
                    CustomText("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Tortor ac leo lorem nisl. Viverra vulputate sodales quis et dui, lacus. Iaculis eu egestas leo egestas vel. Ultrices ut magna nulla facilisi commodo enim, orci feugiat pharetra. Id sagittis, ullamcorper turpis ultrices platea pharetra.",fontWeight: FontWeight.w500,textColor: Color(0xff78828A),fontSize: 14,maxLines: 8,textHeight:1.5),
                  ],
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 10,
              ),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xff121942)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)
                    )
                  )
                ),
                onPressed: (){
                  // Get.defaultDialog(
                  //   title: "",
                  //   middleText: "",
                  //   radius: 16,
                  //   actions: [
                  //     Image.network("https://zimg.qdocti.com/b976b914e37df3aa0f85ef48d87e9fc7?p=0",width: 106,height: 106,)
                  //   ]
                  // );
                  Get.dialog(
                    AlertDialog(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20
                      ),
                      content: Container(
                        height: MediaQuery.of(context).size.height / 2,
                        width:  MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            Image.network("https://zimg.qdocti.com/b976b914e37df3aa0f85ef48d87e9fc7?p=0",width: 106,height: 106,),
                            SizedBox(height: 20,),
                            CustomText("Appointment \n successfully",maxLines: 2,fontWeight: FontWeight.w700,fontSize: 24,textHeight:1.4),
                            SizedBox(height: 20,),
                            CustomText("Lorem Ipsum is simply dummy text of the printing and typesetting industry.",maxLines: 2,fontWeight: FontWeight.w500,fontSize: 14,textColor: Color(0xff6C6C6C),textHeight:1.4),
                            SizedBox(height: 20,),
                            ElevatedButton(
                              style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all<Size>(Size(200, 40)),
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24)
                                  )
                                )
                              ),
                              onPressed: (){},
                              child: CustomText("Continue",textColor: Color(0xffFFFFFF),fontSize: 16,fontWeight: FontWeight.w600,)
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                child: CustomText("Make Appointment",textColor: Color(0xffFFFFFF),fontSize: 16,fontWeight: FontWeight.w600,),
              ),
            ),
          )
        ],
      ),
    );
  }
}
