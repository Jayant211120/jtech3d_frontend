//import some libraries and files
import 'package:flutter/material.dart';
import 'package:frontend/screens/user/home_page.dart';
import 'package:frontend/storage/colors.dart';
import 'package:frontend/widgets/text.dart';
import '../../apis/auth/sign_in_api.dart';

//create send otp controller function
void signInControllerFunction(
    TextEditingController emailController,
    TextEditingController passwordController,
    void Function(bool value) cpi,
    BuildContext context,
    )async{
  //use exception handling for handling the errors
  try{
    cpi(true);
    //create variable
    final email=emailController.text.trim();
    final password=passwordController.text.trim();

    //call send otp api function
    final response=await SignInApi().signInApiFunction(email,password);
print(response?.email);
print(response?.password);
    //checking conditions
    if(response != null){
      if(response.status == true && response.message == "Signin Successfully"){
        cpi(false);
        Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>HomePage()));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: CustomText(
              text: "Signin Successfully",
              color: AppColor.white,
            ),
          ),
        );
      }
      else if(response.status == false && response.message == "User Not Found"){
        cpi(false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: CustomText(
              text: "User Not Found",
              color: AppColor.white,
            ),
          ),
        );
      }
      else if(response.status == false && response.message == "Invalid Credentials"){
        cpi(false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: CustomText(
              text: "Invalid Credentials",
              color: AppColor.white,
            ),
          ),
        );
      }
      else {
        cpi(false);
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
  }catch(err){
    cpi(false);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:CustomText(text:err.toString(),color:AppColor.white),backgroundColor:AppColor.redAccent,));
  }
}