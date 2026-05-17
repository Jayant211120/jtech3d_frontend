// //import some libraries and files
// import 'package:flutter/material.dart';
// import 'package:frontend/screens/sign_in.dart';
//
// //main function
// void main(){
//   runApp(JTECH3D());
// }
//
// //create stateless widget
// class JTECH3D extends StatelessWidget {
//   const JTECH3D({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner:false,
//       home:SignIn(),
//     );
//   }
// }









import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ApiTestScreen(),
    );
  }
}

class ApiTestScreen extends StatefulWidget {
  const ApiTestScreen({super.key});

  @override
  State<ApiTestScreen> createState() => _ApiTestScreenState();
}

class _ApiTestScreenState extends State<ApiTestScreen> {

  final TextEditingController emailController =
  TextEditingController();

  String responseText = "";

  Future<void> sendRequest() async {

    try {

      final response = await http.post(

        Uri.parse(
          "https://jtech3d.onrender.com/auth/v1/sendOtp",
        ),

        headers: {
          "Content-Type": "application/json",
        },

        body: jsonEncode({
          "email": emailController.text,
        }),
      );

      final data = jsonDecode(response.body);

      setState(() {

        responseText =
            const JsonEncoder.withIndent("  ").convert(data);
      });

    } catch (e) {

      setState(() {

        responseText = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Backend Test"),
      ),

      body: Padding(

        padding: const EdgeInsets.all(20),

        child: Column(

          children: [

            TextField(
              controller: emailController,

              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Email",
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: sendRequest,

              child: const Text("Send Request"),
            ),

            const SizedBox(height: 20),

            Text(
              responseText,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}