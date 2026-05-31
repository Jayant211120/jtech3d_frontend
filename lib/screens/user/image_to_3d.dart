//import some libraries and files
import 'package:flutter/material.dart';

//stateful widget
class ImageTo3D extends StatefulWidget {
  const ImageTo3D({super.key});

  @override
  State<ImageTo3D> createState() => _ImageTo3DState();
}

class _ImageTo3DState extends State<ImageTo3D> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child:Column(
          children: [
            Text("ImageTo3D")
          ],
        ),
      );
  }
}
