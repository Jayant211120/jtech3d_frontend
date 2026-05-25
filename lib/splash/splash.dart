//import some libraries and files
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:frontend/screens/auth/email_verification.dart';
import 'package:frontend/screens/user/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../screens/admin/dashboard.dart';
import '../storage/colors.dart';

//create stateful widget
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  //create function
  //create function
  void startApp()async{
    //create instance variable of shared preferences
    final pref = await SharedPreferences.getInstance();
    final token = pref.getString('token');
    final role = pref.getString('role');

    //use timer
    await Future.delayed(Duration(seconds:5),(){
      //checking conditions
      if(token != null){
        if(role == "admin"){
          Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>Dashboard()));
        }
        else{
          Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>HomePage()));
        }
      }
      else{
        Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>EmailVerification()));
      };
    });
  }


  //init state
  @override
  void initState()async{
    startApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColor.black,
      body:Center(
        child:Image.asset("assets/json/3D printer.json"),
      ),
    );
  }
}
