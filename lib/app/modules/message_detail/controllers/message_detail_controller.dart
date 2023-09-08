import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageDetailController extends GetxController{
  final bottomPadding = 0.obs;
  final ScrollController messageListScrollterController = ScrollController();
  final FocusNode bottomFocusNOde = FocusNode();
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
    print("判断是否聚集--${bottomFocusNOde.hasFocus}");
  }
}
