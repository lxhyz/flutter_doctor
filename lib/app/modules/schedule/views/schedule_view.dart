import 'package:doctor/app/data/Widgets/custom_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controllers/schedule_controller.dart';

class ScheduleView extends GetView<ScheduleController> {
  const ScheduleView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText("Schedule"),
      ),
      body:SingleChildScrollView(
        child: Obx(() {
          return Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: PageView(
                    onPageChanged: (int index) {
                      controller.swiperIndex.value = index;
                    },
                    children: [
                      ...List.generate(controller.count.value, (index){
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12)
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 93,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.pink,
                                ),
                              ),
                              SizedBox(width: 20,),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText("Dr.Richar Kandowen",textColor: Colors.white,fontSize: 16,fontWeight: FontWeight.w600,),
                                    CustomText("Child Speicalist",textColor: Colors.white,fontSize: 12,fontWeight: FontWeight.w600,),
                                    SizedBox(height: 8,),
                                    Row(
                                      children: [
                                        Icon(Icons.access_time_sharp,color: Colors.white,size: 20,),
                                        SizedBox(width: 8,),
                                        CustomText("Dr.Richar Kandowen",textColor: Colors.white,fontSize: 16,fontWeight: FontWeight.w600,),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.schedule,color: Colors.white,size: 20,),
                                            SizedBox(width: 8,),
                                            CustomText("12:00 - 13:00",textColor: Colors.white,fontSize: 16,fontWeight: FontWeight.w600,),
                                          ],
                                        ),
                                        Container(
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(15),
                                              color: Colors.white
                                          ),
                                          child: Icon(Icons.phone_enabled,color: Colors.black,size: 20,),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      })
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(controller.count.value, (index) {
                    return Container(
                      width:controller.swiperIndex.value == index ? 20 : 10,
                      height: 10,
                      margin: EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                        color:controller.swiperIndex.value == index ? Colors.black :  Colors.grey.withOpacity(.5),
                        borderRadius: BorderRadius.circular(5)
                      ),
                    );
                  }),
                ),
                SizedBox(height: 20,),
                Center(
                  child: Container(
                    height: 38,
                    width: (50 / 100) * MediaQuery.of(context).size.width,
                    child: ToggleButtons(
                      children: [
                        Text("Complete"),
                        Text("Result",),
                      ],
                      isSelected: controller.selections,
                      color: Colors.black,
                      selectedColor: Colors.white,
                      fillColor: Colors.black,
                      borderRadius: BorderRadius.circular(12),
                      constraints: BoxConstraints(minWidth:  (50 / 100) * MediaQuery.of(context).size.width / 2 - 10,minHeight: 38),
                      onPressed: (int index) {
                        for(var i= 0; i < controller.selections.length;i++){
                          if(i == index) {
                            controller.selections[index] = true;
                          } else {
                            controller.selections[i] = false;
                          }
                          controller.selections.refresh();
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Column(
                  children: [
                    ...List.generate(3, (index){
                      return Container(
                        margin: EdgeInsets.only(
                            bottom: 20
                        ),
                        padding: EdgeInsets.all(20),
                        height: 174,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color(0xfff6f8fe)
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width:80,
                              height: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.grey
                              ),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText("Dr. Emmly Lestiryno",fontWeight: FontWeight.w700,fontSize: 16,),
                                  CustomText("Child Specialist",fontWeight: FontWeight.w500,fontSize: 12,),
                                  CustomText("Dr. Emmly LestirynoDr. Emmly LestirynoDr. Emmly Lestiryno",fontWeight: FontWeight.w700,fontSize: 16,),
                                  Row(
                                    children: [
                                      Expanded(
                                        child:Row(
                                          crossAxisAlignment:CrossAxisAlignment.end,
                                          children: [
                                            Icon(Icons.schedule,size: 20,),
                                            SizedBox(width: 4),
                                            CustomText("Today",fontWeight: FontWeight.w600,fontSize: 12,)
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          child:Row(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Icon(Icons.punch_clock_sharp,size: 20,),
                                              SizedBox(width: 4,),
                                              CustomText("14:30 - 15:40",fontWeight: FontWeight.w600,fontSize: 12,)
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: ElevatedButton(
                                            style:ButtonStyle(
                                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(12),
                                                        side: BorderSide(width: 1,color: Colors.black)
                                                    )
                                                ),
                                                backgroundColor: MaterialStateProperty.all<Color>(Color(0xfff6f8fe)),
                                                elevation: MaterialStateProperty.all<double>(0),
                                                minimumSize: MaterialStateProperty.all<Size>(Size((MediaQuery.of(context).size.width - 40 - 80 - 10) / 2,30))
                                            ),
                                            onPressed: (){},
                                            child: CustomText("Rating",fontSize: 12,fontWeight: FontWeight.w600,)
                                        ),
                                      ),
                                      SizedBox(width: 20,),
                                      Expanded(
                                        child: ElevatedButton(
                                            style:ButtonStyle(
                                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(12),
                                                        side: BorderSide(width: 1,color: Colors.black)
                                                    )
                                                ),
                                                backgroundColor: MaterialStateProperty.all<Color>(Color(0xfff6f8fe)),
                                                elevation: MaterialStateProperty.all<double>(0),
                                                minimumSize: MaterialStateProperty.all<Size>(Size((MediaQuery.of(context).size.width - 40 - 80 - 10) / 2,30))
                                            ),
                                            onPressed: (){},
                                            child: CustomText("Appoitment",fontSize: 12,fontWeight: FontWeight.w600,)
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    })
                  ],
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
