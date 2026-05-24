//create function
import 'package:flutter/material.dart';
import 'package:frontend/apis/auth/forgot_password_api.dart';
import 'package:frontend/screens/auth/reset_password.dart';
import '../../storage/colors.dart';
import '../../widgets/text.dart';

void forgotPasswordController(TextEditingController emailController,BuildContext context)async{
  //initialize controllers
  final email = emailController.text.trim();

  //use exception handling for handling the errors
  try{
    //create response
    final response = await ForgotPasswordApi().forgotPasswordApiFunction(email);

    //checking conditions
    if(response != null){
      if(response.status == true && response.message == "Forgot Password Successfully"){
        Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>ResetPassword()));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:CustomText(text:"Forgot Password Successfully",color:AppColor.white),backgroundColor:AppColor.blue));
      }
      if(response.status == false && response.message == "User Not Exist"){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:CustomText(text:"User Not Exist",color:AppColor.white),backgroundColor:AppColor.red));
      }
     else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:CustomText(text:"Something went wrong in forgot password",color:AppColor.white),backgroundColor:AppColor.red));
      }
    }
  }catch(err){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:CustomText(text:err.toString(),color:AppColor.white),backgroundColor:AppColor.red));
  }
}