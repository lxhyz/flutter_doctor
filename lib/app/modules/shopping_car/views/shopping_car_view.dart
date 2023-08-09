import 'package:doctor/app/data/Widgets/custom_text.dart';
import 'package:doctor/app/data/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/shopping_car_controller.dart';

class ShoppingCarView extends GetView<ShoppingCarController> {
  const ShoppingCarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Car", false),
      body: Obx(() {
        return CustomScrollView(
          physics: NeverScrollableScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                  height:(80 / 100) * MediaQuery.of(context).size.height,  // %82 height
                  padding: EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ...controller.shoppingCarList.map((element) {
                          var index = controller.shoppingCarList.indexOf(element);
                          return Dismissible(
                            key: UniqueKey(),
                            direction: DismissDirection.endToStart,
                            background: Container(
                              padding: EdgeInsets.only(
                                  right: 30
                              ),
                              color: Color(0xfffff5f5),
                              alignment: Alignment.centerRight,
                              child: Icon(Icons.delete_outline,color: Colors.red),
                            ),
                            confirmDismiss: (direction) async {
                              return await Get.defaultDialog(
                                  title: "警告",
                                  middleText: "确认删除吗",
                                  cancel: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all(Colors.white)
                                      ),
                                      onPressed: (){
                                        Get.back(result: false);
                                      },
                                      child: CustomText("取消")
                                  ),
                                  confirm: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all(Colors.black)
                                      ),
                                      onPressed: (){
                                        controller.deleteShoppingCarItem(index);
                                        Get.back(result: true,);
                                      },
                                      child: CustomText("确定",textColor: Colors.white,)
                                  )
                              );
                            },
                            child: Container(
                              height: 87,
                              margin: EdgeInsets.only(
                                  bottom: 20
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 87,
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.grey.withOpacity(.6),
                                    ),
                                    child: Image.network("${element["image"]}",fit: BoxFit.cover),
                                  ),
                                  SizedBox(width: 10,),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        CustomText("${element["name"]}",fontWeight: FontWeight.w600,fontSize: 18,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                alignment:Alignment.centerLeft,
                                                child: CustomText("${element["describe"]}",fontSize: 12,fontWeight: FontWeight.w400,textColor: Color(0xff78828A)),
                                              ),
                                            ),
                                            ElevatedButton(
                                                style: ButtonStyle(
                                                    minimumSize: MaterialStateProperty.all<Size>(Size(24, 24)),
                                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                                    elevation: MaterialStateProperty.all<double>(0),
                                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                            side: BorderSide(width: 1,color: Colors.grey),
                                                            borderRadius: BorderRadius.circular(6)
                                                        )
                                                    )
                                                ),
                                                onPressed: () => controller.unIncreaseNumber(index),
                                                child: CustomText("-",textColor: Colors.black,)
                                            ),
                                            SizedBox(width: 2,),
                                            CustomText("${element["number"]}",fontWeight: FontWeight.w500,fontSize: 16,),
                                            SizedBox(width: 2,),
                                            ElevatedButton(
                                                style: ButtonStyle(
                                                    minimumSize: MaterialStateProperty.all<Size>(Size(24, 24)),
                                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                                    elevation: MaterialStateProperty.all<double>(0),
                                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                            side: BorderSide(width: 1,color: Colors.grey),
                                                            borderRadius: BorderRadius.circular(6)
                                                        )
                                                    )
                                                ),
                                                onPressed: () => controller.increaseNumber(index),
                                                child: CustomText("+",textColor: Colors.black,)
                                            ),
                                          ],
                                        ),
                                        CustomText("\$${element["price"]}",textColor: Color(0xff66707A),fontSize: 16,),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        })
                      ],
                    ),
                  ),
              )
            ),
            SliverFillRemaining(
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10
                ),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Color(0xff121942)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24)
                          )
                      )
                  ),
                  onPressed: (){},
                  child: CustomText("Checkout",textColor: Colors.white,),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
