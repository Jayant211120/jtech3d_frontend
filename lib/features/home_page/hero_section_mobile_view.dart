//import some libraries and files
import 'package:flutter/material.dart';

import '../../models/users/homePage/hero_section.dart';
import '../../storage/colors.dart';
import '../../widgets/container.dart';
import '../../widgets/icon.dart';
import '../../widgets/image.dart';
import '../../widgets/list_tile.dart';
import '../../widgets/text.dart';

//stateless widget
class HeroSectionMobileView extends StatelessWidget {
  const HeroSectionMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    //create list
    final List<SubPartOfHeroSectionInHomePage> features = [
      SubPartOfHeroSectionInHomePage(
        title: "High Quality Prints",
        subtitle: "Precision you can trust",
        icons: Icons.high_quality,
      ),
      SubPartOfHeroSectionInHomePage(
        title: "Fast Turnaround",
        subtitle: "On-time every time",
        icons: Icons.access_time,
      ),
      SubPartOfHeroSectionInHomePage(
        title: "Secure & Reliable",
        subtitle: "Your data is safe",
        icons: Icons.security,
      ),
      SubPartOfHeroSectionInHomePage(
        title: "Custom Solutions",
        subtitle: "Tailored to your needs",
        icons: Icons.build,
      ),
    ];
    return SizedBox(
        width:MediaQuery.of(context).size.width,
        child:Stack(
          children: [
            //background
            CustomContainer(
                color:AppColor.black,
                shape:BoxShape.rectangle,
                width:double.infinity,
                child:Column(
                  children: [

                    //main part
                    Wrap(
                      children: [
                        //image
                        CustomNetworkImage(
                          height:200,
                          fit:BoxFit.cover,
                          url:"https://img.magnific.com/premium-photo/3d-printer-printing-closeup-photorealistic-al-generated_866663-4848.jpg",
                        ),

                        SizedBox(width:50),
                        //content of main part
                        Column(
                          crossAxisAlignment:CrossAxisAlignment.start,
                          children: [
                            CustomText(text:"TURN YOUR IDEAS",color:AppColor.white,fontSize:30,fontWeight:FontWeight.bold),
                            SizedBox(height:3),
                            CustomText(text:"INTO REALITY",color:AppColor.blue,fontSize:30,fontWeight:FontWeight.bold),
                            SizedBox(height:10),
                            CustomText(
                                text:"High quality 3D printing for prototypes,custom products\nand production,Fast,Reliable,Affordable",
                                color:AppColor.white
                            ),

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
                      ],
                    ),


                    //sub part
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: features.map((feature) {
                        return SizedBox(
                          width: 170,
                          child: CustomListTile(
                            title: feature.title,
                            leading: CustomIcon(
                              icon: feature.icons,
                            ),
                            iconColor: AppColor.blue,
                            textColor: AppColor.white,
                            tileColor: Colors.transparent,
                            function: () {},
                          ),
                        );
                      }).toList(),
                    )
                  ],
                )
            )
          ],
        )
    );
  }
}
