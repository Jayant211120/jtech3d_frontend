//import some libraries and files
import 'package:flutter/material.dart';
import 'package:frontend/storage/colors.dart';
import 'package:frontend/widgets/text.dart';

import '../../apis/auth/resend_otp.dart';

//create send otp controller function
void resendOtpControllerFunction(TextEditingController emailController,BuildContext context)async{
  //use exception handling for handling the errors
  try{
    //create variable
    final email=emailController.text.trim();

    //call send otp api function
    final response=await ResendOtpApi().resendOtpApiFunction(email);
    print(response?.message);
    //checking conditions
    if(response != null){
      if(response.message == "OTP resend successfully"){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:CustomText(text:"OTP Resend Successfully",color:AppColor.white),backgroundColor:AppColor.blue,));
      }
      else if(response.message == "Email not exist"){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:CustomText(text:"Email Not Exist",color:AppColor.white),backgroundColor:AppColor.redAccent,));
      }
      else if(response.message == "Something went wrong in resend otp"){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:CustomText(text:"Something Went Wrong in Resend OTP",color:AppColor.white),backgroundColor:AppColor.redAccent,));
      }
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:CustomText(text:"Response Not Found",color:AppColor.white),backgroundColor:AppColor.redAccent,));
    }
  }catch(err){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:CustomText(text:err.toString(),color:AppColor.white),backgroundColor:AppColor.redAccent,));
  }
}