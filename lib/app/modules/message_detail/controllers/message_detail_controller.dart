import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class MessageDetailController extends GetxController{
  final ScrollController messageListScrollterController = ScrollController();
  final FocusNode bottomFocusNOde = FocusNode();
  final TextEditingController textEditingController = TextEditingController();


  final bottomPadding = ''.obs;
  final keyBoradStatus = true.obs;
  final messageList = [
    {
      "type":0,
      "message":"Many people find sport card attractive"
    },
    {
      "type":1,
      "message":"The deposit moeny to the piggy bank when i get money"
    },
    {
      "type":1,
      "message":"."
    },
    {
      "type":0,
      "message":"I want back to home"
    },{
      "type":0,
      "message":"Many people find sport card attractive"
    },
    {
      "type":1,
      "message":"The deposit moeny to the piggy bank when i get money"
    },
    {
      "type":1,
      "message":"."
    },
    {
      "type":0,
      "message":"I want back to home"
    },
    {
      "type":0,
      "message":"Many people find sport card attractive"
    },
    {
      "type":1,
      "message":"The deposit moeny to the piggy bank when i get money"
    },
    {
      "type":1,
      "message":"."
    },
    {
      "type":0,
      "message":"I want back to home"
    },
    {
      "type":0,
      "message":"Many people find sport card attractive"
    },
    {
      "type":1,
      "message":"The deposit moeny to the piggy bank when i get money"
    },
    {
      "type":1,
      "message":"."
    },
    {
      "type":0,
      "message":"I want back to home"
    }
   ].obs;
  final uploadPickerFile = [].obs;
 
  @override
  void onInit() {
    super.onInit();
    bottomFocusNOde.addListener(_focusNodeListener);
    messageListScrollterController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    super.dispose();
    bottomFocusNOde.dispose();
    textEditingController.dispose();
  }

  void unFocusNode(){
    // 取消聚焦
    bottomFocusNOde.unfocus();
  }

  void _scrollListener(){
    // print("offset------${messageListScrollterController.offset}");
    // print("max_offset-${messageListScrollterController.position.maxScrollExtent}");
    // 当前滚动距离 messageListScrollController.offset
    // 最大滚动距离 messageListScrollController.position.maxScorllExtent
  }

  void _focusNodeListener() {
    // 判断是否聚集
    if(bottomFocusNOde.hasFocus) {
      double currentOffset = messageListScrollterController.offset;
      double maxOffset = messageListScrollterController.position.maxScrollExtent;
      if(currentOffset < maxOffset) {
        messageListScrollterController.animateTo(
          300,
          duration: Duration(milliseconds:100),
          curve: Curves.easeIn
        );
      }
    }
    // print("判断是否聚集--${bottomFocusNOde.hasFocus}");
  }

  void changeVolumDown() {
    keyBoradStatus.value = !keyBoradStatus.value;
  }

  void submitted(dynamic value) {
    messageList.add(
      {
        "type":1,
        "message":value
      },
    );
    textEditingController.clear();
  }

  void handlerPickerFile(List<AssetEntity>? entitys) {
    entitys!.forEach((item) => {
      uploadPickerFile.add(item),
      messageList.add(
        {
          "type":1,
          "message":"image*"
        }
      )
    });
  }
}
