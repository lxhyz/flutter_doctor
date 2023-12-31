import 'package:doctor/app/data/Widgets/custom_text.dart';
import 'package:doctor/app/data/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Notification",false),
      body: SingleChildScrollView(
        child: Obx((){
          return Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...controller.notificationList.map((element){
                  var parentIndex = controller.notificationList.indexOf(element);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if((element["messageList"] as List).length >= 1)SizedBox(height: 20,),
                      if((element["messageList"] as List).length >= 1)CustomText("${element['title']}",fontSize: 16,fontWeight: FontWeight.w700,),
                      if((element["messageList"] as List).length >= 1)SizedBox(height: 20,),
                      if((element["messageList"] as List).length >= 1)...(element["messageList"] as List).map((messageElement) {
                        var childIndex = (element["messageList"] as List).indexOf(messageElement);
                        return Dismissible(
                          key: Key("${messageElement['message']}"),
                          // 滑动方法设置
                          direction: DismissDirection.endToStart,
                          confirmDismiss: (direction) async{
                            return await Get.defaultDialog(
                              title: "action",
                              radius: 12,
                              middleText: "是否删除",
                              cancel: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
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
                                  controller.deleteNotificationItem(parentIndex, childIndex);
                                  Get.back(result: true);
                                },
                                child: CustomText("确定",textColor: Colors.white,)
                              ),
                            );
                          },
                          background: Container(
                            color: Colors.green,
                          ),
                          secondaryBackground:  Container(
                            color: Color(0xfffdf3f3),
                            alignment: Alignment.centerRight,
                            child: Icon(Icons.delete,color: Colors.red,),
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                          ),
                          child: ListTile(
                            contentPadding: EdgeInsets.all(0),
                            leading: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(.5),
                                borderRadius: BorderRadius.circular(20)
                              ),
                            ),
                            title: Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(
                                bottom: 10
                              ),
                              child:CustomText("${messageElement['message']}",textColor: Color(0xff171725),fontSize: 14,fontWeight: FontWeight.w500,maxLines: 3,textAlign:TextAlign.start,textHeight: 1.2,),
                            ),
                            subtitle: Container(
                              alignment: Alignment.centerLeft,
                              child:CustomText("${messageElement['time']}",textColor: Color(0xff78828A),fontSize: 12,fontWeight: FontWeight.w500,),
                            ),
                          ),
                        );
                      })
                    ],
                  );
                }).toList()
              ],
            ),
          );
        }),
      ),
    );
  }
}
