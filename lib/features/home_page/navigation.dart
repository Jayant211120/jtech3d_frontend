//import some files and libraries
import 'package:flutter/material.dart';

import '../../models/users/homePage/navigation_bar.dart';
import '../../storage/colors.dart';
import '../../widgets/button.dart';

//stateless widget
class Navigation extends StatelessWidget {
  const Navigation({super.key});

  @override
  Widget build(BuildContext context) {
    //create list
    final List<HomePageNavigationBarModel> features = [
      HomePageNavigationBarModel(
        name:"Home",
        function:"/homePage"
      ),
      HomePageNavigationBarModel(
          name:"3D Models",
          function:"/availableProducts"
      ),
      HomePageNavigationBarModel(
          name:"CustomProducts",
          function:"/customProducts"
      ),
      HomePageNavigationBarModel(
          name:"Image To 3D",
          function:"/imageTo3d"
      ),
      HomePageNavigationBarModel(
          name:"STL to 3D",
          function:"/stlTo3d"
      ),
      HomePageNavigationBarModel(
          name:"Tickets",
          function:"/raisedTickets"
      ),
      HomePageNavigationBarModel(
          name:"Training",
          function:"/training"
      ),
    ];

    return  Expanded(
      child: Row(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          //create variable
          for(int data=0;data<features.length;data++)
            CustomTextButton(
              text:features[data].name,
              textColor:AppColor.white,
              containerColor:AppColor.transparent,
              function:(){Navigator.pushNamed(context,features[data].function);},
            )
        ],
      ),
    );
  }
}
