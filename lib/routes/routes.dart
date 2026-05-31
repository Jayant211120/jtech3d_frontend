//import some libraries and files
import 'package:flutter/material.dart';
import 'package:frontend/routes/layout.dart';

import '../screens/user/available_products.dart';
import '../screens/user/custom_products.dart';
import '../screens/user/home_page.dart';
import '../screens/user/image_to_3d.dart';
import '../screens/user/raised_ticket.dart';
import '../screens/user/settings.dart';
import '../screens/user/stl_to_3d.dart';
import '../screens/user/training.dart';

//create class
class UserRoutes {
  //create variable
  static const homePage = "/homePage";
  static const availableProducts = "/availableProducts";
  static const customProducts = "/customProducts";
  static const imageTo3d = "/imageTo3d";
  static const stlTo3d = "/stlTo3d";
  static const raisedTickets = "/raisedTickets";
  static const training = "/training";
  static const settings = "/settings";

  //create routes
  static Map<String,WidgetBuilder> routes ={
    homePage:(context)=>Layout(body:HomePage()),
    availableProducts:(context)=>Layout(body:AvailableProducts()),
    customProducts:(context)=>Layout(body:CustomProducts()),
    imageTo3d:(context)=>Layout(body:ImageTo3D()),
    stlTo3d:(context)=>Layout(body:StlTo3D()),
    raisedTickets:(context)=>Layout(body:RaisedTickets()),
    training:(context)=>Layout(body:Training()),
    settings:(context)=>Layout(body:Settings()),
  };
}
