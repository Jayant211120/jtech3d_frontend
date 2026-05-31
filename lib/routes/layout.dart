import 'package:flutter/material.dart';
import 'package:frontend/routes/routes.dart';
import 'package:frontend/widgets/button.dart';
import 'package:frontend/widgets/icon.dart';
import 'package:frontend/widgets/list_tile.dart';
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
    final responsive = MediaQuery.of(context).size.width < 768;


    //create Lists
    final List<String> drawerItems = ["Home","3D Models","Custom Products","Image to 3D Model","stl/obj to 3D Model","Raised Tickets","Training"];
    final List<IconData> drawerIcons = [Icons.home,Icons.model_training,Icons.food_bank,Icons.image,Icons.file_copy,Icons.airplane_ticket,Icons.train];
    final List<IconData> bottomNavigationBarIcons = [Icons.home,Icons.food_bank,Icons.airplane_ticket,Icons.settings];
    final List<String> bottomNavigationBarLabel = ["Home","3D-Models","Raised Ticket","Settings"];
    final List<String> callBackFunctions = ["/homePage","/availableProducts","/customProducts","/imageTo3d","/stlTo3d","/raisedTickets","/training"];
    final List<String> bottomRoutes = [UserRoutes.homePage,UserRoutes.availableProducts,UserRoutes.raisedTickets,UserRoutes.settings,
    ];

    return Scaffold(
      //background color
        backgroundColor:AppColor.white,

        //appbar
        appBar:AppBar(
          backgroundColor:AppColor.black,
          title:CustomText(text:"JTECH3D",fontSize:20,color:AppColor.white),
          iconTheme:IconThemeData(color:AppColor.white),
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
            )
          ],
        ),

        //body
        body:widget.body,

        //drawer
        drawer:responsive ? null
            :Drawer(
          backgroundColor:AppColor.black,
          child:Column(
            children: [
              //header
              DrawerHeader(
                child:Column(
                  children: [
                    CustomIcon(icon:Icons.face)
                  ],
                ),
              ),
              //items
              ListView.builder(
                itemCount:drawerItems.length,
                shrinkWrap:true,
                physics:NeverScrollableScrollPhysics(),
                itemBuilder:(context,value){
                  return CustomListTile(
                      title:drawerItems[value],
                      textColor:AppColor.white,
                      leading:CustomIcon(icon:drawerIcons[value],color:AppColor.white,),
                      function:(){print(callBackFunctions[value]);Navigator.pushNamed(context,callBackFunctions[value]);}
                  );
                },
              )
            ],
          ),
        ),

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
