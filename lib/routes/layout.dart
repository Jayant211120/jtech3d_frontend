//import some libraries and files
import 'package:flutter/material.dart';
import 'package:frontend/features/home_page/navigation.dart';
import 'package:frontend/routes/routes.dart';
import 'package:frontend/widgets/button.dart';
import '../../storage/colors.dart';
import '../../widgets/text.dart';
class Layout extends StatefulWidget {
  //create variable
  final Widget body;
  const Layout({super.key,required this.body});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  //crete variables
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    //create variables
    final responsive = MediaQuery.of(context).size.width < 1020;


    //create Lists
    final List<String> drawerItems = ["Home","3D Models","Custom Products","Image to 3D","stl to 3D","Tickets","Training"];
    final List<IconData> bottomNavigationBarIcons = [Icons.home,Icons.food_bank,Icons.airplane_ticket,Icons.settings];
    final List<String> bottomNavigationBarLabel = ["Home","3D-Models","Raised Ticket","Settings"];
    final List<String> bottomRoutes = [UserRoutes.homePage,UserRoutes.availableProducts,UserRoutes.raisedTickets,UserRoutes.settings,
    ];

    return Scaffold(
      //background color
        backgroundColor:AppColor.white,

        //appbar
        appBar:AppBar(
          backgroundColor:AppColor.black,
          automaticallyImplyLeading:false,
          iconTheme:IconThemeData(color:AppColor.white),
          title:responsive ?
            CustomText(text:"JTECH3D",color:AppColor.white,)
              :
            Row(
            children: [
              //title
              CustomText(text:"JTECH3D",color:AppColor.white),

              //navigation bar
              Navigation()
            ],
          ),

          actions: [
            //notification
            CustomTextButtonWithIcon(
              text:"",
              containerColor:AppColor.transparent,
              icon:Icons.notification_add,
              iconColor:AppColor.white,
            ),
            //cart
            CustomTextButtonWithIcon(
              text:"",
              containerColor:AppColor.transparent,
              icon:Icons.add_shopping_cart,
              iconColor:AppColor.white,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: CustomTextButtonWithIcon(
                text:"Logout",
                textColor:AppColor.white,
                icon:Icons.power_settings_new,
                iconColor:AppColor.white,
                containerColor:AppColor.blue,
              ),
            )
          ],
        ),

        //body
        body:widget.body,

        //bottom navigation bar
        bottomNavigationBar:responsive ?
        BottomNavigationBar(
          type:BottomNavigationBarType.fixed,
          backgroundColor:AppColor.black,
          unselectedItemColor:AppColor.white,
          selectedItemColor:AppColor.blueAccent,
          selectedIconTheme:IconThemeData(color:AppColor.blueAccent),
          unselectedIconTheme:IconThemeData(color:AppColor.white),
          currentIndex:_selectedIndex,
          onTap:(index){
            print(bottomRoutes[index]);
            setState(()=>_selectedIndex = index);
            Navigator.pushNamed(context,bottomRoutes[index]);
          },
          items: [
            for(int navigation = 0;navigation < bottomNavigationBarIcons.length;navigation++)
              BottomNavigationBarItem(
                  icon:Icon(bottomNavigationBarIcons[navigation]),
                  label:bottomNavigationBarLabel[navigation],
              ),
          ],
        ):null
    );
  }
}
