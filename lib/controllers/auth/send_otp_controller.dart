//import some libraries and files
import 'package:flutter/material.dart';
import 'package:frontend/apis/auth/send_otp_api.dart';
import 'package:frontend/storage/colors.dart';
import 'package:frontend/widgets/text.dart';

//create send otp controller function
void sendOtpControllerFunction(TextEditingController emailController,BuildContext context,bool sendOtp,void Function(VoidCallback n) setState)async{
  //use exception handling for handling the errors
  try{
    //create variable
    final email=emailController.text.trim();

    //call send otp api function
    final response=await SendOtpApi().sendOtpApiFunction(email);
print(response?.message);
    //checking conditions
    if(response != null){
      if(response.message == "OTP send successfully"){
        setState((){
          sendOtp=true;
      });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:CustomText(text:"OTP Send Successfully",color:AppColor.white),backgroundColor:AppColor.blue,));
      }
      else if(response.message == "Email already exist"){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:CustomText(text:"Email Already Exist",color:AppColor.white),backgroundColor:AppColor.redAccent,));
      }
      else if(response.message == "Something went wrong in send otp"){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:CustomText(text:"Something Went Wrong in Send OTP",color:AppColor.white),backgroundColor:AppColor.redAccent,));
      }
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:CustomText(text:"Response Not Found",color:AppColor.white),backgroundColor:AppColor.redAccent,));
    }
  }catch(err){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:CustomText(text:err.toString(),color:AppColor.white),backgroundColor:AppColor.redAccent,));
  }
}