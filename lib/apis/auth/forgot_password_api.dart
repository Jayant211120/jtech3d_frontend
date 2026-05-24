//import some libraries and files
import 'dart:convert';
import 'package:frontend/models/auth/sign_up.dart';
import 'package:http/http.dart' as http;

//create class
class ForgotPasswordApi {
  //create function
  Future<SignUpModel?> forgotPasswordApiFunction(String email)async{
    //use exception handling for handling the errors
    try{
      //create response
      final response = await http.post(
        Uri.parse("https://jtech3d.onrender.com/auth/v1/forgotPassword"),
        headers:{"Content-Type":"application/json",},
        body:jsonEncode({"email":email}),
      ).timeout(
        const Duration(seconds:30),
      );
      print(response.body);
      //json decode
      final data = jsonDecode(response.body);

      //return the model
      return SignUpModel.fromJson(data);
    }catch(err){
      print(err);
      return null;
    }
  }
}