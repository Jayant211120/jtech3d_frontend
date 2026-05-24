//import some libraries and files
import 'package:flutter/material.dart';
import 'package:frontend/controllers/auth/reset_password_controller.dart';
import 'package:frontend/widgets/button.dart';

import '../../storage/colors.dart';
import '../../widgets/text_field.dart';

//stateful widget
class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  //create controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //create variables
  bool cpi=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(),
      body:SingleChildScrollView(
        child:Column(
          children: [
            //Name
            CustomTextField(
              controller:emailController,
              text: 'Email',
              inputTextColor:AppColor.black,
            ),
            
            //otp
            CustomTextField(
              controller:otpController,
              text: 'OTP',
              inputTextColor:AppColor.black,
            ),
            
            //password
            CustomTextField(
              controller:passwordController,
              text: 'Password',
              inputTextColor:AppColor.black,
            ),
            
            //button
            CustomTextButton(
                text:cpi ? "Loading..." : "Reset Password",
                containerColor:AppColor.white,
                textColor:AppColor.blue,
              function:(){
                  resetPasswordController(
                      emailController,
                      otpController,
                      passwordController,
                      (value){
                        cpi=value;
                      },
                      context
                  );
              },
            ),
          ],
        ),
      ),
    );
  }
}
