//import some libraries and files
import 'package:flutter/material.dart';
import 'package:frontend/widgets/button.dart';
import 'package:frontend/widgets/container.dart';
import 'package:frontend/widgets/icon.dart';
import 'package:frontend/widgets/image.dart';
import 'package:frontend/widgets/list_tile.dart';
import 'package:frontend/widgets/text.dart';

import '../../storage/colors.dart';

//stateful widget
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //create variables
  final List<String> subPartOfHeroSectionTitle = ["High Quality Prints","Fast Turnaround","Secure & Reliable","CustomSolutions"];
  final List<String> subPartOfHeroSectionSubTitle = ["Precision you can trust","On-time every time","Your data is safe","Tailored to your needs"];
  final List<IconData> subPartOfHeroSectionIcons = [Icons.high_quality,Icons.punch_clock,Icons.security,Icons.transgender];

  @override
  Widget build(BuildContext context) {
    //create variable
    final isMobile = MediaQuery.of(context).size.width < 1000;

    return SingleChildScrollView(
      child:
      //mobile screen
      isMobile ? null :


      //web screen
      Column(
        children: [

          //hero section
          SizedBox(
            height:400,width:MediaQuery.of(context).size.width,
            child:Stack(
              children: [
                //background
                CustomContainer(
                  color:AppColor.black,
                  shape:BoxShape.rectangle,

                  child:Column(
                    //crossAxisAlignment:CrossAxisAlignment.center,
                  children: [
                  //main part
                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                    children: [
                      //content of main part
                      Column(
                        crossAxisAlignment:CrossAxisAlignment.start,
                        children: [
                          CustomText(text:"TURN YOUR IDEAS",color:AppColor.white,fontSize:30,fontWeight:FontWeight.bold),
                          SizedBox(height:5),
                          CustomText(text:"INTO REALITY",color:AppColor.blue,fontSize:30,fontWeight:FontWeight.bold),
                          SizedBox(height:10),
                          Wrap(children:[CustomText(text:"High quality 3D printing for prototypes,custom products\nand production,Fast,Reliable,Affordable",color:AppColor.white)]),

                          SizedBox(height:10),
                          //explore products
                              SizedBox(
                                width:210,
                                child: CustomListTile(
                                    title:"Explore Products",
                                    textColor:AppColor.white,
                                    trailing:CustomIcon(icon:Icons.arrow_forward),
                                    iconColor:AppColor.white,
                                    tileColor:AppColor.blue,
                                    function:(){}
                                ),
                              ),
                        ],
                      ),
                      //image
                      CustomNetworkImage(
                        height:300,
                          url:"https://img.magnific.com/premium-photo/3d-printer-printing-closeup-photorealistic-al-generated_866663-4848.jpg",
                      ),
                    ],
                  ),


                  //sub part
                  SizedBox(
                    height:100,
                    child: ListView.builder(
                      shrinkWrap:true,
                      itemCount:subPartOfHeroSectionTitle.length,
                      scrollDirection:Axis.horizontal,
                      itemBuilder:(context,value){
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: SizedBox(
                            width:250,
                            child: CustomListTileWithSubTitle(
                                title:subPartOfHeroSectionTitle[value],
                                subTitle:subPartOfHeroSectionSubTitle[value],
                                leading:CustomIcon(icon:subPartOfHeroSectionIcons[value]),
                                iconColor:AppColor.blue,
                                textColor:AppColor.white,
                                function:(){}
                            ),
                          ),
                        );
                      },
                    ),
                  )
              ],
            ))
                  ],
                )
            ),

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
