//import some libraries and files
import 'package:flutter/material.dart';
import 'package:frontend/features/home_page/hero_section_web_view.dart';
import 'package:frontend/features/home_page/how_it_work_web_view.dart';
import 'package:frontend/features/home_page/services_web_view.dart';
import 'package:frontend/features/home_page/why_choose.dart';

import '../../features/home_page/contact.dart';
import '../../features/home_page/hero_section_mobile_view.dart';
import '../../features/home_page/how_it_works_mobile_view.dart';
import '../../features/home_page/needs_some_custom.dart';
import '../../features/home_page/popular_categories.dart';

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
      child:Column(
            children: [

              //hero section
              isMobile ?
              HeroSectionMobileView()

              :HeroSectionWebView(),

              //how it work
              isMobile ?
              HowItWorkMobileView()

              :HowItWorkWebView(),

              //our services
              Services(),

              //need some custom
              NeedSomeCustom(),

              //popular categories
              PopularCategories(),

              //why choose
              WhyChoose(),

              //footer
              ContactUs()


            ],
          )
    );
  }
}
