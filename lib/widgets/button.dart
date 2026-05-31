//import some libraries and file
import 'package:flutter/material.dart';
import 'package:frontend/widgets/text.dart';

import 'container.dart';

//create custom button

//text button
class CustomTextButton extends StatelessWidget {
  //create variables
  final Color containerColor;
  final String text;
  final Color textColor;
  final double ? containerHeight;
  final double ? containerWidth;
  final VoidCallback ? function;


  const CustomTextButton({super.key,required this.text,required this.containerColor,required this.textColor,this.containerHeight,this.containerWidth,this.function});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      height:containerHeight,
      width:containerWidth,
      color:containerColor,
      shape:BoxShape.rectangle,
      child: TextButton(
        onPressed:function,
        style:TextButton.styleFrom(
          shape:RoundedRectangleBorder(
            borderRadius:BorderRadius.circular(10)
          )
        ),
        child:CustomText(text:text,color:textColor,),
      ),
    );
  }
}

//text button with linear gradient
class CustomTextButtonWithLinearGradient extends StatelessWidget {
  //create variables
  final List<Color> gradientColors;
  final String text;
  final Color textColor;
  final double ? containerHeight;
  final double ? containerWidth;
  final AlignmentGeometry begin;
  final AlignmentGeometry end;
  final VoidCallback ? function;

  const CustomTextButtonWithLinearGradient({super.key,required this.text,required this.gradientColors,required this.textColor,this.containerHeight,this.containerWidth,required this.begin,required this.end,this.function});

  @override
  Widget build(BuildContext context) {
    return CustomContainerWithGradient(
      height:containerHeight,
      width:containerWidth,
      colors:gradientColors,
      begin:begin,
      end:end,
      child: TextButton(
        onPressed:function,
        style:TextButton.styleFrom(
            shape:RoundedRectangleBorder(
                borderRadius:BorderRadius.circular(10)
            )
        ),
        child:CustomText(text:text,color:textColor,),
      ),
    );
  }
}

//text button with icon
class CustomTextButtonWithIcon extends StatelessWidget {
  //create variables
  final Color containerColor;
  final String text;
  final IconData icon;
  final double ? containerHeight;
  final double ? containerWidth;
  final VoidCallback ? function;
  final Color ? iconColor;
  final TextDirection ? textDirection;
  final Color ? textColor;

  const CustomTextButtonWithIcon({super.key,required this.text,required this.containerColor,required this.icon,this.containerHeight,this.containerWidth,this.function,this.iconColor,this.textDirection,this.textColor});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      height:containerHeight,
      width:containerWidth,
      color:containerColor,
      shape:BoxShape.rectangle,
      child: TextButton.icon(
        label:CustomText(text:text,color:textColor,),
        icon:Icon(icon,color:iconColor,textDirection:textDirection),
        onPressed:function,
        style:TextButton.styleFrom(
            shape:RoundedRectangleBorder(
                borderRadius:BorderRadius.circular(10)
            )
        ),
      ),
    );
  }
}

//Elevated button
class CustomElevatedButton extends StatelessWidget {
  //create variables
  final Color containerColor;
  final String text;
  final Color textColor;
  final double ? containerHeight;
  final double ? containerWidth;
  final VoidCallback ? function;

  const CustomElevatedButton({super.key,required this.text,required this.containerColor,required this.textColor,this.containerHeight,this.containerWidth,this.function});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      height:containerHeight,
      width:containerWidth,
      color:containerColor,
      shape:BoxShape.rectangle,
      child: ElevatedButton(
        onPressed:function,
        style:TextButton.styleFrom(
            shape:RoundedRectangleBorder(
                borderRadius:BorderRadius.circular(10)
            )
        ),
        child:CustomText(text:text,color:textColor,),
      ),
    );
  }
}


//text button with icon
class CustomElevatedButtonWithIcon extends StatelessWidget {
  //create variables
  final Color containerColor;
  final String text;
  final IconData icon;
  final double ? containerHeight;
  final double ? containerWidth;
  final VoidCallback ? function;
  final Color ? iconColor;

  const CustomElevatedButtonWithIcon({super.key,required this.text,required this.containerColor,required this.icon,this.containerWidth,this.containerHeight,this.function,this.iconColor});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      height:containerHeight,
      width:containerWidth,
      color:containerColor,
      shape:BoxShape.rectangle,
      child: TextButton.icon(
        icon:Icon(icon,color:iconColor),
        label:CustomText(text:text),
        onPressed:function,
        style:TextButton.styleFrom(
            shape:RoundedRectangleBorder(
                borderRadius:BorderRadius.circular(10)
            )
        ),
      ),
    );
  }
}
