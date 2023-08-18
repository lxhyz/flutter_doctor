import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class customSmartFooter extends StatelessWidget {
  final LoadStatus mode;
  customSmartFooter({required this.mode});
  @override
  Widget build(BuildContext context){
    Widget body;
    if(mode==LoadStatus.idle){
      body =  Text("上拉刷新");
    }
    else if(mode==LoadStatus.loading){
      body =  Text("加载中");
    }
    else if(mode == LoadStatus.failed){
      body = Text("加载失败");
    }
    else if(mode == LoadStatus.canLoading){
      body = Text("加载更多");
    }
    else{
      body = Text("到底了");
    }
    return Container(
      height: 50,
      child: Center(child: body),
    );
  }
}