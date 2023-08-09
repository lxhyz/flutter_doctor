import 'package:doctor/app/data/widgets/custom_text.dart';
import 'package:doctor/app/utils/isLogin.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/store_controller.dart';

class StoreView extends GetView<StoreController> {
  const StoreView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  CustomText("Store"),
        centerTitle: true,
        actions: [
          Center(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                GestureDetector(
                  child: Icon(Icons.shopping_bag_outlined,size: 30,),
                  onTap: (){
                    if(IsLogin()){
                      Get.toNamed("/shopping-car");
                    }
                  },
                ),
                Positioned(
                  right: -2,
                  top: 2,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.green
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(width: 20,)
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 56,
            margin: EdgeInsets.symmetric(
              horizontal: 20
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Color(0xffF6F8FE)
            ),
            child: TextField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search,color: Colors.grey,),
                suffixIcon: Icon(Icons.format_align_center,color: Colors.black,),
                hintText: "Search...",
                hintStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                ),
                contentPadding: EdgeInsets.symmetric(
                    horizontal: 20
                ),
              ),
              textAlignVertical: TextAlignVertical.center,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: GridView.count(
            crossAxisCount: 2,
            physics: NeverScrollableScrollPhysics(),
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            shrinkWrap: true,
            childAspectRatio: 0.8,
            children: [
              ...List.generate(10, (index){
                return LayoutBuilder(
                  builder: (BuildContext context,BoxConstraints constraints){
                    final containerWidth = constraints.maxWidth;
                    final containerHeight = constraints.maxHeight;
                    return Container(
                      // color: Colors.red.withOpacity(.5),
                      width: containerWidth,
                      height: containerHeight,
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: containerHeight / 1.5,
                            width:containerWidth,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            clipBehavior: Clip.hardEdge,
                            child: Image.network(
                              "https://zimg.qdocti.com/3ece890d877b123aad3ebe5841252f87",
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 10,),
                          CustomText("Obardans",fontSize: 16,fontWeight: FontWeight.w700,),
                          SizedBox(height: 5,),
                          CustomText("Lorem ipsum dolor sit ",fontSize: 12,fontWeight: FontWeight.w400,),
                          SizedBox(height: 15,),
                          CustomText("\$12",fontSize: 14,fontWeight: FontWeight.w700,),
                        ],
                      ),
                    );
                  },
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
