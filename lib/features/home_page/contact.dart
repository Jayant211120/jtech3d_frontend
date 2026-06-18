//import some libraries and files
import 'package:flutter/material.dart';
import 'package:frontend/widgets/container.dart';

//stateless widget
class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      shape:BoxShape.rectangle,
      child:Row(
        children: [
          //
          CustomContainer(
            shape:BoxShape.rectangle,
          )
        ],
      ),
    );
  }
}
