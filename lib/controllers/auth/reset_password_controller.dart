//import some libraries and files
import 'package:flutter/material.dart';
import 'package:frontend/screens/auth/email_verification.dart';
import '../../apis/auth/reset_password_api.dart';
import '../../storage/colors.dart';
import '../../widgets/text.dart';

//create verification
void resetPasswordController(TextEditingController emailController,TextEditingController otpController,TextEditingController newPasswordController,BuildContext context)async{
  //initialize controllers
  final email = emailController.text.trim();
  final otp =int.parse(otpController.text.trim());
  final newPassword = newPasswordController.text.trim();

  //use exception handling for handling the errors
  try{
    //create response
    final response = await ResetPasswordApi().resetPasswordApiFunction(email,otp,newPassword);

    //checking conditions
    if(response != null){
      if(response.status == true && response.message == "Password Reset Successfully"){
        Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>EmailVerification()));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:CustomText(text:"Password Reset Successfully",color:AppColor.white),backgroundColor:AppColor.blue));
      }
      else if(response.status == false && response.message == "Invalid Credentials"){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:CustomText(text:"Invalid Credentials",color:AppColor.white),backgroundColor:AppColor.red));
      }
      else if(response.status == false && response.message == "User Not Found"){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:CustomText(text:"User Not Found",color:AppColor.white),backgroundColor:AppColor.red));
      }
      else if(response.status == false && response.message == "Invalid OTP"){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:CustomText(text:"Invalid OTP",color:AppColor.white),backgroundColor:AppColor.red));
      }
      else if(response.status == false && response.message == "Invalid User"){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:CustomText(text:"Invalid User",color:AppColor.white),backgroundColor:AppColor.red));
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:CustomText(text:"Something went wrong in reset password",color:AppColor.white),backgroundColor:AppColor.red));
      }
    }
  }catch(err){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:CustomText(text:err.toString(),color:AppColor.white),backgroundColor:AppColor.red));
  }
}