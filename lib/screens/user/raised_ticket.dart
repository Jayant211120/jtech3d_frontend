//import some libraries and files
import 'package:flutter/material.dart';

//stateful widget
class RaisedTickets extends StatefulWidget {
  const RaisedTickets({super.key});

  @override
  State<RaisedTickets> createState() => _RaisedTicketsState();
}

class _RaisedTicketsState extends State<RaisedTickets> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child:Column(
          children: [
            Text("Raised TIckets")
          ],
        ),
      );
  }
}
