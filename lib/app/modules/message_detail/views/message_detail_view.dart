import 'package:doctor/app/data/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/message_detail_controller.dart';

class MessageDetailView extends GetView<MessageDetailController>{
  MessageDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Map<String,dynamic> parameters = Get.parameters;
    final Map<String,dynamic> arguments = Get.arguments;
    final String name = parameters['name'];
    final String messageValue = arguments["message"];
    // 获取软键盘高度
    var keyboardSize = MediaQuery.of(context).viewInsets.bottom;
    return Obx(() {
      return Scaffold(
        // 禁止键盘弹起而自动调整
        resizeToAvoidBottomInset:false, 
        appBar: AppBar(
          // title: CustomText("$name"),
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              Icon(Icons.chevron_left_rounded),
              ClipOval(
                child: Container(
                  alignment: Alignment.center,
                  width: 30,
                  height: 30,
                  color: Colors.grey.withOpacity(.4),
                  child: CustomText("4",textColor: Colors.black),
                ),
              ),
              SizedBox(width: 40,),
              CustomText("$name - $keyboardSize")
            ],
          ),
          centerTitle: true,
        ),
        body:  CustomScrollView(
          physics: NeverScrollableScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: GestureDetector(
                onTap: (){
                  controller.unFocusNode();
                },
                child: Container(
                  height: MediaQuery.of(context).size.height - (140 +keyboardSize),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: ListView(
                    controller: controller.messageListScrollterController,
                    shrinkWrap: true,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipOval(
                            child: Container(
                              width: 40,
                              height: 40,
                              color: Colors.grey,
                              child: Image.network("https://img2.baidu.com/it/u=1980488535,891106663&fm=253&fmt=auto&app=138"),
                            ),
                          ),
                          SizedBox(width: 20,),
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                width: 200,
                                height: 70,
                                decoration: BoxDecoration(
                                  borderRadius:BorderRadius.circular(10),
                                  color: Colors.grey.withOpacity(.2)
                                ),
                              ),
                              Positioned(
                                top: 0,
                                left: -22,
                                child:Icon(
                                  Icons.arrow_left_outlined,
                                  size: 40,
                                  color: Colors.grey.withOpacity(.2)
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SliverFillRemaining(
              child: Container(
                child: TextField(
                  focusNode: controller.bottomFocusNOde,
                )
              ),
            )
          ],
        ),
      );
    });
  }

  
}
