// //import some libraries and files
// import 'dart:convert';
// import 'package:frontend/models/auth/email_verification.dart';
// import 'package:http/http.dart' as http;
//
// //create class
// class SendOtpApi {
//   //create function
//   Future<EmailVerificationModel?> sendOtpApiFunction(String email)async{
//     //use exception handling for handling the error
//     try{
//       final response = await http.post(
//         Uri.parse("https://jtech3d.onrender.com/auth/v1/sendOtp"),
//         headers:{"Content-Type":"application/json"},
//         body:jsonEncode({"email":email}),
//       );
//       print(response.statusCode);
//       print(response.body);
//       final data=jsonDecode(response.body);
//       return EmailVerificationModel.fromJson(data);
//     }catch(e){
//       return null;
//     }
//   }
// }

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/auth/email_verification.dart';

class SendOtpApi {

  Future<EmailVerificationModel?> sendOtpApiFunction(String email) async {

    try {

      final response = await http.post(
        Uri.parse("https://jtech3d.onrender.com/auth/v1/sendOtp"),
        headers: {
          "Content-Type": "application/json"
        },

        body: jsonEncode({
          "email": email
        }),

      ).timeout(
        const Duration(seconds:30),
      );

      print("STATUS CODE: ${response.statusCode}");
      print("BODY: ${response.body}");

      final data = jsonDecode(response.body);

      return EmailVerificationModel.fromJson(data);

    } catch (e) {

      print("API ERROR: $e");

      return null;
    }
  }
}