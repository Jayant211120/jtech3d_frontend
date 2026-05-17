//import some libraries and files
import 'package:flutter/material.dart';

//custom icon
class CustomIcon extends StatelessWidget {
  //create variable
  final IconData icon;
  final Color ? color;
  final double ? size;

  const CustomIcon({super.key,required this.icon,this.color,this.size});

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color:color,
      size:size,
    );
  }
}
