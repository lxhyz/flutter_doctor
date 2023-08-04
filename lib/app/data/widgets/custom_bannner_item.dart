import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomBannerItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  CustomBannerItem(String this.title,String this.imageUrl);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 64,
            width: 64,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xffECEAFF)
            ),
          ),
          CustomText(title,fontSize: 12,fontWeight: FontWeight.w500,textColor: Color(0xff66707A),)
        ],
      ),
    );
  }
}