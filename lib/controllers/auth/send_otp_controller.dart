//import some libraries and files
import 'package:flutter/material.dart';
import 'package:frontend/apis/auth/send_otp_api.dart';
import 'package:frontend/storage/colors.dart';
import 'package:frontend/widgets/text.dart';

//create send otp controller function
void sendOtpControllerFunction(TextEditingController emailController,BuildContext context,void Function(bool value) setState)async{
  //use exception handling for handling the errors
  try{
    //create variable
    final email=emailController.text.trim();

    //call send otp api function
    final response=await SendOtpApi().sendOtpApiFunction(email);
    print(response?.message);
    //checking conditions
    if(response != null){

      if(response.status == true){

        setState(true);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: CustomText(
              text: "OTP Send Successfully",
              color: AppColor.white,
            ),
          ),
        );

      } else {

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: CustomText(
              text: response.message ?? "Something went wrong",
              color: AppColor.white,
            ),
          ),
        );

      }

    }
    // if(response != null){
    //   if(response.status == true && response.message == "OTP send successfully"){
    //     setState(true);
    //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:CustomText(text:"OTP Send Successfully",color:AppColor.white),backgroundColor:AppColor.blue,));
    //   }
    //   else if(response.status == false && response.message == "Email already exist"){
    //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:CustomText(text:"Email Already Exist",color:AppColor.white),backgroundColor:AppColor.redAccent,));
    //   }
    //   else if(response.status == false && response.message == "Something went wrong in send otp"){
    //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:CustomText(text:"Something Went Wrong in Send OTP",color:AppColor.white),backgroundColor:AppColor.redAccent,));
    //   }
    // }
    // else{
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:CustomText(text:"Response Not Found",color:AppColor.white),backgroundColor:AppColor.redAccent,));
    // }
  }catch(err){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:CustomText(text:err.toString(),color:AppColor.white),backgroundColor:AppColor.redAccent,));
  }
}