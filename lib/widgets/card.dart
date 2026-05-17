//import some libraries and files
import 'package:flutter/material.dart';
import 'package:frontend/widgets/container.dart';
import 'package:frontend/widgets/text.dart';

//custom card
class CustomCard extends StatelessWidget {
  //create variables
  final Color color;
  final double ? elevation;
  final ShapeBorder ? shape;
  final Widget widget;
  final double ? height;
  final double ? width;

  const CustomCard({super.key,required this.color,this.elevation,this.shape,required this.widget,this.width,this.height});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      height:height,
      width:width,
      shape:BoxShape.rectangle,
      child: Card(
        color:color,
        elevation:elevation,
        shape:shape,
        child:widget
      ),
    );
  }
}

//custom container with text
class CustomCardWithText extends StatelessWidget {
  //create variables
  final Color color;
  final double ? elevation;
  final ShapeBorder ? shape;
  final String text;
  final double ? height;
  final double ? width;
  final Color ? textColor;
  final double ? size;
  final FontWeight ? fontWeight;

  const CustomCardWithText({super.key,required this.color,this.elevation,this.shape,required this.text,this.width,this.height,this.size,this.fontWeight,this.textColor});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      height:height,
      width:width,
      shape:BoxShape.rectangle,
      child: Card(
          color:color,
          elevation:elevation,
          shape:shape,
          child:CustomText(text:text,color:textColor,fontSize:size,fontWeight:fontWeight,)
      ),
    );
  }
}
