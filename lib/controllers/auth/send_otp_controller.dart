//import some libraries and files
import 'package:flutter/material.dart';
import 'package:frontend/apis/auth/send_otp_api.dart';
import 'package:frontend/storage/colors.dart';
import 'package:frontend/widgets/text.dart';

//create send otp controller function
void sendOtpControllerFunction(TextEditingController emailController,BuildContext context,void Function(bool value) setState,void Function(bool value) cpi)async{
  //use exception handling for handling the errors
  try{
    cpi(true);
    //create variable
    final email=emailController.text.trim();

    //call send otp api function
    final response=await SendOtpApi().sendOtpApiFunction(email);
    print(response?.message);

    //checking conditions
    if(response != null){
      if(response.status == true){
        cpi(false);//circular progress indicator
        setState(true);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: CustomText(text: "OTP Send Successfully",color: AppColor.white),backgroundColor:AppColor.blue,));
      }
      else {
        cpi(false);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: CustomText(text: response.message ?? "Something went wrong",color: AppColor.white),backgroundColor:AppColor.redAccent));
      }
    }
  }catch(err){
    cpi(false);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:CustomText(text:err.toString(),color:AppColor.white),backgroundColor:AppColor.redAccent));
  }
}