//import some libraries and files
import 'package:flutter/material.dart';
import 'package:frontend/screens/sign_in.dart';

//main function
void main(){
  runApp(JTECH3D());
}

//create stateless widget
class JTECH3D extends StatelessWidget {
  const JTECH3D({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home:SignIn(),
    );
  }
}