//import some libraries and files
import "package:flutter/material.dart";

//custom list tile
class CustomListTile extends StatelessWidget {
  //create variables
  final Widget ? leading;
  final Widget ? trailing;
  final String title;
  final String subTitle;
  final VoidCallback function;
  final Color ? tileColor;
  final Color ? textColor;
  final Color ? iconColor;
  final TextStyle ? subTitleTextStyle;

  const CustomListTile({super.key,this.leading,this.trailing,required this.title,required this.subTitle,required this.function,this.tileColor,this.iconColor,this.textColor,this.subTitleTextStyle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:leading,
      title:Text(title),
      subtitle:Text(subTitle),
      trailing:trailing,
      onTap:function,
      tileColor:tileColor,
      textColor:textColor,
      iconColor:iconColor,
      subtitleTextStyle:subTitleTextStyle,
    );
  }
}
