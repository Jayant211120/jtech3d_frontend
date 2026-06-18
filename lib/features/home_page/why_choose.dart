//import some libraries and files
import 'package:flutter/material.dart';
import 'package:frontend/models/users/homePage/list_tile_type_model.dart';
import 'package:frontend/widgets/icon.dart';
import 'package:frontend/widgets/list_tile.dart';
import 'package:frontend/widgets/text.dart';

import '../../storage/colors.dart';

//stateless widget
class WhyChoose extends StatelessWidget {
  const WhyChoose({super.key});

  @override
  Widget build(BuildContext context) {
    //create variable list
    final List<ListTileTypeModel> features = [
      ListTileTypeModel(
          title:"Industry Leading",
          subtitle:"Technology",
          icons:Icons.transgender
      ),
      ListTileTypeModel(
          title:"Premium Quality",
          subtitle:"Materials",
          icons:Icons.high_quality
      ),
      ListTileTypeModel(
          title:"Affordable",
          subtitle:"Pricing",
          icons:Icons.price_change
      ),
      ListTileTypeModel(
          title:"Expert Support",
          subtitle:"24x7 Support",
          icons:Icons.support
      ),
    ];

    return Column(
      children: [
        //heading
        Padding(
          padding: const EdgeInsets.all(20),
          child: CustomText(text:"Why Choose JTECH3D?",fontSize:20,fontWeight:FontWeight.bold),
        ),

        //content
        Wrap(
          spacing:20,
          runSpacing:20,
          direction:Axis.horizontal,
          children:features.map((feature){
            return SizedBox(
              width:300,
              child: CustomListTileWithSubTitle(
                  title:feature.title,
                  subTitle:feature.subtitle,
                  leading:CustomIcon(icon:feature.icons,size:20,color:AppColor.blue),
                  function:(){}
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
