//import some libraries and files
import "package:flutter/material.dart";
import "package:frontend/widgets/text.dart";

//custom list tile
class CustomListTile extends StatelessWidget {
  //create variables
  final Widget ? leading;
  final Widget ? trailing;
  final String title;
  final VoidCallback function;
  final Color ? tileColor;
  final Color ? textColor;
  final Color ? iconColor;
  final TextStyle ? subTitleTextStyle;

  const CustomListTile({super.key,this.leading,this.trailing,required this.title,required this.function,this.tileColor,this.iconColor,this.textColor,this.subTitleTextStyle});

  @override
  Widget build(BuildContext context) {
    return Material(
      color:tileColor,
      borderRadius:BorderRadius.circular(10),
      child: ListTile(
        leading:leading,
        shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(10)),
        title:CustomText(text:title),
        trailing:trailing,
        onTap:function,
        tileColor:tileColor,
        textColor:textColor,
        iconColor:iconColor,
        subtitleTextStyle:subTitleTextStyle,
      ),
    );
  }
}


//custom list tile with sub title
class CustomListTileWithSubTitle extends StatelessWidget {
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

  const CustomListTileWithSubTitle({super.key,this.leading,this.trailing,required this.title,required this.subTitle,required this.function,this.tileColor,this.iconColor,this.textColor,this.subTitleTextStyle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:leading,
      title:CustomText(text:title),
      subtitle:CustomText(text:subTitle),
      trailing:trailing,
      onTap:function,
      tileColor:tileColor,
      textColor:textColor,
      iconColor:iconColor,
      subtitleTextStyle:subTitleTextStyle,
    );
  }
}
