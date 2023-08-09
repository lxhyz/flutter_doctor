import 'package:get/get.dart';

class MessageController extends GetxController {
  final contactInfoList = [
    {
      'avatar': 'https://example.com/avatar1.png',
      'name': 'John Doe',
      'time': '10:30 AM',
      'message': 'Hello, how are you?',
    },
    {
      'avatar': 'https://example.com/avatar2.png',
      'name': 'Jane Smith',
      'time': '11:45 AM',
      'message': 'I\'m doing great. Thanks for asking!',
    },
    {
      'avatar': 'https://example.com/avatar3.png',
      'name': 'Mike Johnson',
      'time': '1:20 PM',
      'message': 'Can we meet tomorrow for lunch?',
    },
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

  void deleteOnlyDetail(int index) {
    print(index);
    contactInfoList.removeAt(index);
    print(contactInfoList);
    contactInfoList.refresh();
  }
}
