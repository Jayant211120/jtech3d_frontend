//import some libraries and files
import 'package:flutter/material.dart';
import 'package:frontend/models/users/homePage/list_tile_type_model.dart';
import 'package:frontend/widgets/icon.dart';
import 'package:frontend/widgets/list_tile.dart';
import 'package:frontend/widgets/text.dart';

import '../../storage/colors.dart';


//stateless widget
class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    //create variable
    final isMobile = MediaQuery.of(context).size.width < 1020;

    //create list
    final List<ListTileTypeModel> features = [
      ListTileTypeModel(
          title:"Custom Products",
          subtitle:"From idea to 3D model",
          icons:Icons.dashboard_customize
      ),
      ListTileTypeModel(
          title:"Image To 3D Model",
          subtitle:"Exact model like image",
          icons:Icons.eighteen_mp
      ),
      ListTileTypeModel(
        title:"Raised Tickets",
        subtitle:"Quick solution of your problem",
        icons:Icons.print,
      ),
      ListTileTypeModel(
          title:"Training",
          subtitle:"Take training of 3D Printing",
          icons:Icons.train
      ),
    ];

    return Column(
      children: [
        //heading
        Padding(
          padding: const EdgeInsets.all(20),
          child: CustomText(text:"OUR SERVICES",fontSize:20,fontWeight:FontWeight.bold,),
        ),

        //main content
        Padding(
          padding: const EdgeInsets.all(10),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: features.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:isMobile ? 1 : 4,
              crossAxisSpacing:20,
              mainAxisSpacing: 20,
              childAspectRatio:isMobile ? 13 : 4,
            ),
            itemBuilder: (context, index) {
              final feature = features[index];
              return CustomListTileWithSubTitle(
                title: feature.title,
                subTitle: feature.subtitle,
                leading: CustomIcon(icon: feature.icons,size:40,color:AppColor.blue),
                function: () {},
              );
            },
          ),
        ),
      ],
    );
  }
}
