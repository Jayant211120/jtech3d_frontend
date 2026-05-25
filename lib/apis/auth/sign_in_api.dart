//import some libraries and files
import 'dart:convert';
import 'package:frontend/models/auth/sign_up.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

//create class
class SignInApi {
  //create function
  Future<SignUpModel?> signInApiFunction(String email,String password)async{
    //use exception handling for handling the errors
    try{
      //create response
      final response = await http.post(
          Uri.parse("https://jtech3d.onrender.com/auth/v1/signIn"),
          headers:{"Content-Type":"application/json"},
          body:jsonEncode({"email":email,"password":password})
      );
      print(response.body);

      //decode the json
      final data = jsonDecode(response.body);

      //return the model
      return SignUpModel.fromJson(data);
    }catch(err){
      return null;
    }
  }
}