//import some libraries and files
import 'package:flutter/material.dart';

//custom text
class CustomText extends StatelessWidget {
  final String text;
  final double ? fontSize;
  final Color ? color;
  final FontWeight ? fontWeight;
  final double ? height;
  const CustomText({super.key,required this.text,this.fontSize,this.color,this.fontWeight,this.height});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:TextStyle(
        fontSize:fontSize,
        color:color,
        fontWeight:fontWeight,
        height:height,
      ),
    );
  }
}