//import some libraries and files
import 'package:flutter/material.dart';
import 'package:frontend/features/home_page/hero_section_web_view.dart';

import '../../features/home_page/hero_section_mobile_view.dart';

//stateful widget
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //create variable
    final isMobile = MediaQuery.of(context).size.width < 1020;

    return SingleChildScrollView(
      child:
      //mobile screen
      isMobile ?
          Column(
            children: [
              HeroSectionMobileView()
            ],
          )

      :
      //web screen
      Column(
        children: [
          HeroSectionWebView()

          //how it works


          //our services


          //need a something custom


          //popular categories


          //why choose jtech3d


          //our recent work


          //what our client says


          //footer

        ],
      ),
    );
  }
}
