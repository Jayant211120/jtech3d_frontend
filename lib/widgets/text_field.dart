//import some libraries and files
import 'package:flutter/material.dart';
import '../storage/colors.dart';

// custom text field
class CustomTextField extends StatelessWidget {
  // variables
  final TextEditingController controller;
  final String text;
  final IconData ? prefixIcon;
  final IconData ? suffixIcon;
  final Color ? prefixIconColor;
  final Color ? suffixIconColor;
  final Color ? fillColor;
  final TextStyle ? textStyle;
  final Color ? inputTextColor;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.text,
    this.prefixIcon,
    this.prefixIconColor,
    this.suffixIcon,
    this.suffixIconColor,
    this.fillColor,
    this.textStyle,
    this.inputTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller:controller,
      style:TextStyle(color:inputTextColor),
      decoration:InputDecoration(
        hintText:text,
        fillColor:fillColor,
        hintStyle:textStyle,
        labelStyle:TextStyle(color:AppColor.white),
        prefixIcon:Icon(prefixIcon),
        suffixIcon:Icon(suffixIcon),
        prefixIconColor:prefixIconColor,
        suffixIconColor:suffixIconColor,
        enabledBorder:OutlineInputBorder(
            borderRadius:BorderRadius.circular(10),
            borderSide:BorderSide(color:AppColor.blue)
        ),
        border:OutlineInputBorder(
            borderRadius:BorderRadius.circular(10),
            borderSide:BorderSide(color:AppColor.blue)
        ),
        disabledBorder:OutlineInputBorder(
            borderRadius:BorderRadius.circular(10),
            borderSide:BorderSide(color:AppColor.grey)
        ),
      ),
    );
  }
}

// custom text field with obscure text
class CustomTextFieldWithObscureText extends StatelessWidget {
  // variables
  final TextEditingController controller;
  final String text;
  final IconData ? prefixIcon;
  final IconData ? suffixIcon;
  final Color ? prefixIconColor;
  final Color ? suffixIconColor;
  final Color ? fillColor;
  final TextStyle ? textStyle;
  final Color ? inputTextColor;


  const CustomTextFieldWithObscureText({
    super.key,
    required this.controller,
    required this.text,
    this.prefixIcon,
    this.prefixIconColor,
    this.suffixIcon,
    this.suffixIconColor,
    this.fillColor,
    this.textStyle,
    this.inputTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller:controller,
      obscureText:true,
      style:TextStyle(color:inputTextColor),
      decoration:InputDecoration(
        hintText:text,
        fillColor:fillColor,
        hintStyle:textStyle,
        prefixIcon:Icon(prefixIcon),
        suffixIcon:Icon(suffixIcon),
        prefixIconColor:prefixIconColor,
        suffixIconColor:suffixIconColor,
        enabledBorder:OutlineInputBorder(
          borderRadius:BorderRadius.circular(10),
          borderSide:BorderSide(color:AppColor.blue)
        ),
        disabledBorder:OutlineInputBorder(
            borderRadius:BorderRadius.circular(10),
            borderSide:BorderSide(color:AppColor.grey)
        ),
      ),
    );
  }
}

//drop down menu
class CustomDropDownMenu extends StatefulWidget {
  final List<DropdownMenuEntry<String>> dropDownEntry;
  final String initialValue;

  const CustomDropDownMenu({
    super.key,
    required this.dropDownEntry,
    required this.initialValue,
  });

  @override
  State<CustomDropDownMenu> createState() => _CustomDropDownMenuState();
}

class _CustomDropDownMenuState extends State<CustomDropDownMenu> {
  //create variables
  late String parameters;

  @override
  void initState() {
    super.initState();
    parameters = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: parameters,
      dropdownMenuEntries: widget.dropDownEntry,
      width:double.infinity,
      textStyle:TextStyle(color:AppColor.white),
      inputDecorationTheme:InputDecorationTheme(
        enabledBorder:OutlineInputBorder(
          borderSide:BorderSide(color:AppColor.blue),
          borderRadius:BorderRadius.circular(10)
        ),
      ),
      onSelected: (value) {
        if (value != null) {
          setState(() {
            parameters = value;
          });
        }
      },
    );
  }
}