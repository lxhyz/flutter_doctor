import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CustomSmartHeader extends StatelessWidget{
  final RefreshStatus mode;
  CustomSmartHeader({required this.mode});
  @override
  Widget build(BuildContext context){
    Widget body;
    if(mode ==  RefreshStatus.idle) {
      body = Text("下拉加载");
    }
    else if(mode == RefreshStatus.canRefresh) {
      body = Text("放上刷新");
    }
    else if(mode == RefreshStatus.refreshing) {
      body = Text("加载中");
    }
    else if(mode == RefreshStatus.failed) {
      body = Text("加载失败");
    }
    else if(mode == RefreshStatus.completed) {
      body = Text("加载完毕");
    }
    else {
      body = Text("");
    }
    return Center(
      child: body,
    );
  }
}