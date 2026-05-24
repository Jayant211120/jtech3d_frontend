//import some libraries and files
import 'package:flutter/material.dart';
import 'package:frontend/apis/auth/email_verification.dart';
import 'package:frontend/storage/colors.dart';
import 'package:frontend/widgets/text.dart';

//create send otp controller function
void emailVerificationControllerFunction(
    TextEditingController emailController,
    TextEditingController otpController,
    void Function(bool value) setState,
    void Function(bool value) cpi,
    BuildContext context
    )async{
  //use exception handling for handling the errors
  try{
    cpi(true);
    //create variable
    final email=emailController.text.trim();
    final otp=int.parse(otpController.text.trim());

    //call send otp api function
    final response=await EmailVerificationApi().emailVerificationApiFunction(email,otp);
    print(response?.message);
    //checking conditions
    if(response != null){
      if(response.message == "Email Verified Successfully"){
        cpi(false);
        setState(true);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:CustomText(text:"Email Verified Successfully",color:AppColor.white),backgroundColor:AppColor.blue,));
      }
      else if(response.message == "Email not exist"){
        cpi(false);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:CustomText(text:"Email Not Exist",color:AppColor.white),backgroundColor:AppColor.redAccent,));
      }
      else if(response.message == "Invalid OTP"){
        cpi(false);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:CustomText(text:"Invalid OTP",color:AppColor.white),backgroundColor:AppColor.redAccent,));
      }
      else if(response.message == "OTP Expired"){
        cpi(false);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:CustomText(text:"OTP Expired",color:AppColor.white),backgroundColor:AppColor.redAccent,));
      }
    }
    else{
      cpi(false);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:CustomText(text:"Response Not Found",color:AppColor.white),backgroundColor:AppColor.redAccent,));
    }
  }catch(err){
    cpi(false);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:CustomText(text:err.toString(),color:AppColor.white),backgroundColor:AppColor.redAccent,));
  }
}