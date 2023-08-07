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
      appBar: CustomAppBar("Notification"),
      body: SingleChildScrollView(
        child: Obx((){
          return Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...controller.notificationList.map((element){
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20,),
                      CustomText("${element['title']}",fontSize: 16,fontWeight: FontWeight.w700,),
                      SizedBox(height: 20,),
                      ...(element["messageList"] as List).map((messageElement) {
                        return ListTile(
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
