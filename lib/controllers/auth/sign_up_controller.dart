//import some libraries and files
import 'package:flutter/material.dart';
import 'package:frontend/apis/auth/sign_up_api.dart';
import 'package:frontend/screens/auth/email_verification.dart';
import 'package:frontend/storage/colors.dart';
import 'package:frontend/widgets/text.dart';

//create send otp controller function
void signUpControllerFunction(
    TextEditingController nameController,
    TextEditingController addressController,
    String gender,
    TextEditingController passwordController,
    String role,
    TextEditingController codeController,
    TextEditingController mobileNumberController,
    BuildContext context,
    )async{
  //use exception handling for handling the errors
  try{
    //create variable
    final name=nameController.text.trim();
    final mobileNumber=int.parse(mobileNumberController.text.trim());
    final address=addressController.text.trim();
    final password=passwordController.text.trim();
    final code=codeController.text.trim();

    //call send otp api function
    final response=await SignUpApi().signUpApiFunction(name,address, gender, password, role, code, mobileNumber);

    //checking conditions
    if(response != null){
      if(response.status == true && response.message == "Signup Successfully"){
        Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>EmailVerification()));
        ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: CustomText(
              text: "Signup Successfully",
              color: AppColor.white,
            ),
          ),
        );
      }
      else if(response.status == false && response.message == "Email Not Verified"){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: CustomText(
              text: "Email Not Verified",
              color: AppColor.white,
            ),
          ),
        );
      }
      else if(response.status == false && response.message == "Password Not Hashed"){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: CustomText(
              text: "Password Not Hashed",
              color: AppColor.white,
            ),
          ),
        );
      }
      else {
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
    print(err);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:CustomText(text:err.toString(),color:AppColor.white),backgroundColor:AppColor.redAccent,));
  }
}