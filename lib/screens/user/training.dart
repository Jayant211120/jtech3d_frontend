//import some libraries and files
import 'package:flutter/material.dart';

//stateful widget
class Training extends StatefulWidget {
  const Training({super.key});

  @override
  State<Training> createState() => _TrainingState();
}

class _TrainingState extends State<Training> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child:Column(
          children: [
            Text("Training")
          ],
        ),
      );
  }
}
