//import some libraries and files
import 'dart:convert';
import 'package:frontend/models/auth/email_verification.dart';
import 'package:http/http.dart' as http;

//create class
class EmailVerificationApi {
  //create function
  Future<EmailVerificationModel?> emailVerificationApiFunction(String email,int otp)async{
    //use exception handling for handling the error
    try{
      final response = await http.post(
        Uri.parse("https://jtech3d.onrender.com/auth/v1/email_verification"),
        headers:{"Content-Type":"application/json"},
        body:jsonEncode({"email":email,"otp":otp}),
      );
      print(response.body);
      final data=jsonDecode(response.body);
      return EmailVerificationModel.fromJson(data);
    }catch(e){
      return null;
    }
  }
}