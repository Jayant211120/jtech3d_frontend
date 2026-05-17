//import some libraries and files
import 'package:flutter/material.dart';

//custom container
class CustomContainer extends StatelessWidget {
  //create variables
  final double ? height;
  final double ? width;
  final Color ? color;
  final Widget ? child;
  final BoxShape shape;
  const CustomContainer({super.key,this.child,this.height,this.width,this.color,required this.shape});

  @override
  Widget build(BuildContext context) {
    return Container(
        height:height,
        width:width,
        decoration:BoxDecoration(
            color:color,
          shape:shape
        ),
        child:child
    );
  }
}

//custom container with image
class CustomContainerWithImage extends StatelessWidget {
  //create variables
  final double ? height;
  final double ? width;
  final Color ? color;
  final Widget ? child;
  final String image;

  const CustomContainerWithImage({super.key,this.child,this.height,this.width,this.color,required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height:height,
      width:width,
      decoration:BoxDecoration(
        color:color,
        image:DecorationImage(
            image:NetworkImage(image),
          fit:BoxFit.cover,
        )
      ),
      child:child
    );
  }
}

//custom container with gradient
class CustomContainerWithGradient extends StatelessWidget {
  //create variables
  final double ? height;
  final double ? width;
  final List<Color> colors;
  final Widget ? child;
  final AlignmentGeometry begin;
  final AlignmentGeometry end;

  const CustomContainerWithGradient({super.key,this.child,this.height,this.width,required this.colors,required this.begin,required this.end});

  @override
  Widget build(BuildContext context) {
    return Container(
        height:height,
        width:width,
        decoration:BoxDecoration(
         gradient:LinearGradient(
           begin:begin,
           end:end,
           colors:colors
         ),
        ),
        child:child
    );
  }
}
