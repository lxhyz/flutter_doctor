import 'package:doctor/app/data/Widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.only(
        top: 20,
      ),
      decoration: BoxDecoration(
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 88,
            height: 100,
            child: Stack(
              children: [
                Container(
                  child: Container(
                    height: 88,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12)
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: (88 / 2) - 32.5,
                  child: Container(
                    width: 65,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.black.withOpacity(.5)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.star,color: Colors.orange,size: 16,),
                        SizedBox(width: 5,),
                        CustomText("4.0",fontSize: 12,fontWeight: FontWeight.w600,textColor: Color(0xffFEFEFE),)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(width:14,),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                bottom: 20
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText("Dr. Emmly Lestiryno",textColor: Color(0xff171725),fontSize: 16,fontWeight: FontWeight.w600,),
                  CustomText("General Practitioner",textColor: Color(0xff78828A),fontSize: 12,fontWeight: FontWeight.w600,),
                  Row(
                    children: [
                      Icon(Icons.location_on,color: Colors.black,size: 20,),
                      SizedBox(width: 5,),
                      CustomText("General Practitioner",textColor: Color(0xff434E58),fontSize: 12,fontWeight: FontWeight.w500,),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}