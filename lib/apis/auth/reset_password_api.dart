//import some libraries and files
import 'dart:convert';
import 'package:frontend/models/auth/sign_up.dart';
import 'package:http/http.dart' as http;

//create class
class ResetPasswordApi {
  //create function
  Future<SignUpModel?> resetPasswordApiFunction(String email,int otp,String newPassword)async{
    //use exception handling for handling the errors
    try{
      //create response
      final response = await http.post(
        Uri.parse("https://jtech3d.onrender.com/auth/v1/resetPassword"),
        headers:{
          "Content-Type":"application/json",
        },
        body:jsonEncode({"email":email,"otp":otp,"newPassword":newPassword}),
      );

      //json decode
      final data = jsonDecode(response.body);
      print(response.body);

      //return the model
      return SignUpModel.fromJson(data);
    }catch(err){
      print(err);
      return null;
    }
  }
}