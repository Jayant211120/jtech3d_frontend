//import some files and libraries
import 'package:flutter/material.dart';
import 'package:frontend/models/users/homePage/list_tile_type_model.dart';
import '../../storage/colors.dart';
import '../../widgets/container.dart';
import '../../widgets/icon.dart';
import '../../widgets/image.dart';
import '../../widgets/list_tile.dart';
import '../../widgets/text.dart';

//stateless widget
class HeroSectionWebView extends StatelessWidget {
  const HeroSectionWebView({super.key});

  @override
  Widget build(BuildContext context) {
    //create list
    final List<ListTileTypeModel> features = [
      ListTileTypeModel(
        title: "High Quality Prints",
        subtitle: "Precision you can trust",
        icons: Icons.high_quality,
      ),
      ListTileTypeModel(
        title: "Fast Turnaround",
        subtitle: "On-time every time",
        icons: Icons.access_time,
      ),
      ListTileTypeModel(
        title: "Secure & Reliable",
        subtitle: "Your data is safe",
        icons: Icons.security,
      ),
      ListTileTypeModel(
        title: "Custom Solutions",
        subtitle: "Tailored to your needs",
        icons: Icons.build,
      ),
    ];

    return SizedBox(
        height:400,width:MediaQuery.of(context).size.width,
        child:Stack(
          children: [
            //background
            CustomContainer(
                color:AppColor.black,
                shape:BoxShape.rectangle,

                child:Column(
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
                        itemCount:features.length,
                        scrollDirection:Axis.horizontal,
                        itemBuilder:(context,value){
                          //create variable
                          final feature = features[value];

                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: SizedBox(
                              width:250,
                              child: CustomListTileWithSubTitle(
                                  title:feature.title,
                                  subTitle:feature.subtitle,
                                  leading:CustomIcon(icon:feature.icons),
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
                )
            )
          ],
        )
    );
  }
}
