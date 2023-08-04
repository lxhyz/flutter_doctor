import 'package:flutter/material.dart';


class CustomText extends StatelessWidget{
  String value;
  int maxLines;
  double fontSize;
  Color textColor;
  TextOverflow overflow;
  FontWeight fontWeight;
  CustomText(String this.value,{this.maxLines = 1,this.fontSize = 20,this.textColor = Colors.black,this.overflow = TextOverflow.ellipsis,this.fontWeight = FontWeight.w500});
  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight:fontWeight,
        color: textColor,
      ),
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}