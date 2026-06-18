//import some libraries and files
import 'package:flutter/material.dart';
import 'package:frontend/routes/routes.dart';
import 'package:frontend/screens/scroll_behaviour.dart';
import 'package:frontend/splash/splash.dart';

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
      scrollBehavior:MyScrollBehavior(),
      initialRoute:"/",
      routes:{
        "/":(context)=>Splash(),

        ///user route
        ...UserRoutes.routes,

        ///admin route
      },
    );
  }
}