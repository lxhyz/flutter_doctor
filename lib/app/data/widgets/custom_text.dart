import 'package:flutter/material.dart';


class CustomText extends StatelessWidget{
  String value;
  int maxLines;
  double fontSize;
  Color textColor;
  TextOverflow overflow;
  FontWeight fontWeight;
  double textHeight;
  CustomText(String this.value,{this.maxLines = 1,this.fontSize = 20,this.textColor = Colors.black,this.overflow = TextOverflow.ellipsis,this.fontWeight = FontWeight.w500,this.textHeight = 1.0});
  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight:fontWeight,
        color: textColor,
        height: textHeight
      ),
      maxLines: maxLines,
      overflow: overflow,

    );
  }
}