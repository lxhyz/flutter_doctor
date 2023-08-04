import 'package:doctor/app/data/Widgets/custom_text.dart';
import 'package:doctor/app/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/root_controller.dart';

class RootView extends GetView<RootController> {
  const RootView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: controller.bottomIndex.value,
          children: [
            HomeView()
          ],
        ),
      ),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          currentIndex: controller.bottomIndex.value,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled,color: Colors.grey,),activeIcon: Icon(Icons.home_filled,color: Colors.black,),label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.broken_image_outlined,color: Colors.grey,),activeIcon: Icon(Icons.broken_image,color: Colors.black,),label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.event_note,color: Colors.grey,),activeIcon: Icon(Icons.event_note,color: Colors.black,),label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined,color: Colors.grey,),activeIcon: Icon(Icons.shopping_bag,color: Colors.black,),label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.person,color: Colors.grey,),activeIcon: Icon(Icons.person,color: Colors.black,),label: ""),
          ],
          onTap: (int index) {
            controller.bottomIndex.value = index;
          },
        );
      }),
    );
  }
}

