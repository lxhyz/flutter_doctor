import 'package:doctor/app/data/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
import 'package:get/get.dart';
import '../controllers/message_detail_controller.dart';

class MessageDetailView extends GetView<MessageDetailController>{
  MessageDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Map<String,dynamic> parameters = Get.parameters;
    final String name = parameters['name'];
    // 获取软键盘高度
    var keyboardSize = MediaQuery.of(context).viewInsets.bottom;
    return Obx(() {
      return Scaffold(
        // 禁止键盘弹起而自动调整
        resizeToAvoidBottomInset:false, 
        appBar: AppBar(
          // title: CustomText("$name"),
          automaticallyImplyLeading: false,
          title: GestureDetector(
            onTap: (){
              Get.back();
            },
            child: Row(
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
                Expanded(
                  child: CustomText("$name - ${controller.keyboardHeight.value}"),
                )
              ],
            ),
          ),
          centerTitle: true,
          actions: [
            PopupMenuButton(
              itemBuilder: (context) {
                return <PopupMenuEntry<String>>[
                  CheckedPopupMenuItem(
                    value: 'english',
                    checked: controller.popupSelectValue.value == 'english',
                    child: Text('english'),
                  ),
                  PopupMenuDivider(),
                  CheckedPopupMenuItem(
                    value: 'chinese',
                    checked: controller.popupSelectValue.value == 'chinese',
                    child: Text('chinese'),
                  ),
                ];
              },
              tooltip: "长按提示",
              initialValue: "chinese",
              offset: Offset(0,50),
              onSelected: (String value){
                controller.popupSelectValue.value = value;
              },
            )
          ],
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
                    children: controller.messageList.map((element){
                      return element['type'] == 0 
                        ? Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                          child: Row(
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
                                  ConstrainedBox(
                                    constraints: BoxConstraints(
                                      maxWidth: MediaQuery.of(context).size.width - 180,
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius:BorderRadius.circular(10),
                                        color: Colors.grey.withOpacity(.2)
                                      ),
                                      child: CustomText(element["message"] as String,maxLines: 99,textAlign: TextAlign.start,),
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
                          ),
                        )
                        : Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  ConstrainedBox(
                                    constraints: BoxConstraints(
                                      maxWidth: MediaQuery.of(context).size.width - 180,
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius:BorderRadius.circular(10),
                                        color: Colors.grey.withOpacity(.2)
                                      ),
                                      child: element['message'] != "image*"
                                          ?
                                            CustomText(element["message"] as String,maxLines: 99,textAlign: TextAlign.start,)
                                          :
                                            Container(
                                              child: Image(
                                                image: AssetEntityImageProvider(controller.uploadPickerFile[0]),
                                              ),
                                            )
                                      ,
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    right: -22,
                                    child:Icon(
                                      Icons.arrow_right_outlined,
                                      size: 40,
                                      color: Colors.grey.withOpacity(.2)
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(width: 20,),
                              ClipOval(
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  color: Colors.grey,
                                  child: Image.network("https://img2.baidu.com/it/u=1980488535,891106663&fm=253&fmt=auto&app=138"),
                                ),
                              ),
                            ],
                          ),
                        );
                    }).toList(),
                  ),
                ),
              ),
            ),
            SliverFillRemaining(
              child: Container(
                alignment: Alignment.topLeft,
                color: Colors.grey.withOpacity(.2),
                child:  Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        controller.changeVolumDown();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child:controller.keyBoradStatus.value ?  Icon(Icons.volume_down,size: 30) : Icon(Icons.keyboard,size: 30,),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        margin: EdgeInsets.symmetric(vertical: 6),
                        child: TextField(
                          controller: controller.textEditingController,
                          enabled: controller.keyBoradStatus.value,
                          focusNode: controller.bottomFocusNOde,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1,color: Colors.transparent)
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 1,color: Colors.transparent)
                            )
                          ),
                          cursorColor: Colors.black,
                          onSubmitted: (String value){
                            controller.submitted(value);
                          },
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Icon(Icons.tag_faces,size: 30),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: GestureDetector(
                        onTap:() async {
                          final List<AssetEntity>? entitys = await AssetPicker.pickAssets(
                            context,
                            pickerConfig:AssetPickerConfig(
                              maxAssets: 9,
                              requestType: RequestType.image,
                            )
                          );
                          controller.handlerPickerFile(entitys);
                        },
                        child:Icon(Icons.add,size: 30)
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
