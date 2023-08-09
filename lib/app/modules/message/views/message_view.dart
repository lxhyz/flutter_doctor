import 'package:doctor/app/data/Widgets/custom_text.dart';
import 'package:doctor/app/data/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/message_controller.dart';

class MessageView extends GetView<MessageController> {
  const MessageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Notification",true),
      body: SafeArea(
        child: Obx(() {
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 20
              ),
              child: Column(
                children: [
                  ...controller.contactInfoList.map((element) {
                    var index = controller.contactInfoList.indexOf(element);
                    return Dismissible(
                      key: Key(element["name"].toString()),
                      direction: DismissDirection.endToStart,
                      confirmDismiss: (direction)async{
                        return await Get.defaultDialog(
                            title: "提示",
                            middleText:"确认删除吗",
                            cancel: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white)
                                ),
                                onPressed: (){
                                  Get.back(result: false);
                                },
                                child: CustomText("取消")
                            ),
                            confirm: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.black)
                                ),
                                onPressed: (){
                                  controller.deleteOnlyDetail(index);
                                  Get.back(result: true);
                                },
                                child: CustomText("确定",textColor: Colors.white,)
                            )
                        );
                      },
                      background: Container(
                        alignment: Alignment.centerRight,
                        color: Color(0xfffef4f4),
                        margin: EdgeInsets.symmetric(
                            vertical: 10
                        ),
                        padding: EdgeInsets.only(right: 40),
                        child: Icon(Icons.delete_outline,color: Colors.red),
                      ),
                      child: Container(
                        height: 56,
                        margin: EdgeInsets.symmetric(
                            vertical: 10
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.grey.withOpacity(.2),offset: Offset(1, 0),)
                            ]
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 56,
                              height: 56,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(28),
                                color: Colors.grey.withOpacity(.3),
                              ),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  CustomText("${controller.contactInfoList[index]["name"]}",fontWeight: FontWeight.w600,fontSize: 18,textColor: Color(0xff171725),),
                                  CustomText("${controller.contactInfoList[index]["message"]}",fontWeight: FontWeight.w500,fontSize: 14,textColor: Color(0xff6C6C6C),),
                                ],
                              ),
                            ),
                            SizedBox(width: 20,),
                            Container(
                              width: 50,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  CustomText("${controller.contactInfoList[index]["time"]}",fontWeight: FontWeight.w600,fontSize: 12,textColor: Color(0xff6C6C6C),),
                                  Container(
                                    // constraints: BoxConstraints(
                                    //   minHeight: 24,
                                    //   minWidth: 24
                                    // ),
                                    width: 24,
                                    height: 24,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.black
                                    ),
                                    child: CustomText("2",textColor: Color(0xffFFFFFF),fontSize: 10,fontWeight: FontWeight.w600,),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }).toList()
                ],
              ),
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: (){},
        child: Icon(Icons.add,color: Colors.white,size: 30,),
      ),
    );
  }
}
