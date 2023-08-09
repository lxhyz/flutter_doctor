import 'package:get/get.dart';

class NotificationController extends GetxController {
  final notificationList = [
    {
      "title":"Today",
      "messageList":[
        {
          "name":"Rich",
          "message":"Dr. Richar Kandowen agreed to an appointment on August 25, 2022 at 7 am",
          "time":"2022-08-07 12:12:00"
        },
        {
          "name":"Kandowen",
          "message":"New message from Dr. Richar Kandowen",
          "time":"2022-08-08 08:12:00"
        }
      ]
    },
    {
      "title":"Yesterday",
      "messageList":[
        {
          "name":"Pay",
          "message":"Payment to make an appointment has been successful",
          "time":"2022-08-07 12:12:00"
        },
      ]
    }
  ].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void deleteNotificationItem(parentIndex,childIndex){
    // 防止联想触发
    if(parentIndex >= 0 && childIndex >= 0){
      (notificationList[parentIndex]["messageList"] as List).removeAt(childIndex);
    }
    notificationList.refresh();
    print(notificationList[parentIndex]);
  }
}
