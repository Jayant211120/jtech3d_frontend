//import some libraries and files
import 'package:flutter/material.dart';

//stateful widget
class AvailableProducts extends StatefulWidget {
  const AvailableProducts({super.key});

  @override
  State<AvailableProducts> createState() => _AvailableProductsState();
}

class _AvailableProductsState extends State<AvailableProducts> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child:Column(
          children: [
            Text("AvailableProducts")
          ],
        ),
      );
  }
}
