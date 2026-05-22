//import some libraries and files
import 'dart:convert';
import 'package:frontend/models/auth/sign_up.dart';
import 'package:http/http.dart' as http;

//create class
class SignUpApi {
  //create function
  Future<SignUpModel?> signUpApiFunction(String name,String address,String gender,String password,String role,String code,int mobileNumber)async{
    //use exception handling for handling the errors
    try{
      //create response
      final response = await http.post(
        Uri.parse("https://jtech3d.onrender.com/auth/v1/signUp"),
        headers:{"Content-Type":"application/json"},
        body:jsonEncode({"name":name,"address":address,"gender":gender,"password":password,"role":role,"code":code,"mobileNumber":mobileNumber})
      );
      print(response.body);
      //decode the json
      final data = jsonDecode(response.body);
      return SignUpModel.fromJson(data);
    }catch(err){
      return null;
    }
  }
}