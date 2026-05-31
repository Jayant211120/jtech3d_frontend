//import some libraries and files
import 'package:flutter/material.dart';

//stateful widget
class CustomProducts extends StatefulWidget {
  const CustomProducts({super.key});

  @override
  State<CustomProducts> createState() => _CustomProductsState();
}

class _CustomProductsState extends State<CustomProducts> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child:Column(
          children: [
            Text("CustomProducts")
          ],
        ),
      );
  }
}
