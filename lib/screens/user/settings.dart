//import some libraries and files
import "package:flutter/material.dart";

//stateful widget
class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child:Column(
          children: [
            Text("Settings")
          ],
        ),
      );
  }
}
