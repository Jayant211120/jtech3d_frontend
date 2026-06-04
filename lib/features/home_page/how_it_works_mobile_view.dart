//import some libraries and files
import 'package:flutter/material.dart';
import 'package:frontend/models/users/homePage/container_type_model.dart';
import 'package:frontend/widgets/icon.dart';
import 'package:frontend/widgets/list_tile.dart';
import 'package:frontend/widgets/text.dart';
import '../../storage/colors.dart';

//stateless widget
class HowItWorkMobileView extends StatelessWidget {
  const HowItWorkMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    //create variable list
    final List<ContainerTypeModel> features = [
      ContainerTypeModel(
          icon:Icons.file_copy,
          heading:"1.Upload",
          subheading:"Upload 3D model or share your idea"
      ),
      ContainerTypeModel(
          icon:Icons.file_present,
          heading:"2.Get a Quote",
          subheading:"We review and send you a quote"
      ),
      ContainerTypeModel(
          icon:Icons.print,
          heading:"3.Print",
          subheading:"We 3D print your part with high precision"
      ),
      ContainerTypeModel(
          icon:Icons.delivery_dining,
          heading:"4.Deliver",
          subheading:"Safe packaging and fast delivery"
      ),
    ];

    return Column(
      children: [
        //heading
        Padding(
          padding: const EdgeInsets.all(20),
          child: CustomText(
            text:"HOW IT WORKS",
            fontWeight:FontWeight.bold,
            fontSize:20,
          ),
        ),

        //process
        SizedBox(
          height:420,
          child: ListView.builder(
            itemCount:features.length,
            shrinkWrap:true,
            physics:NeverScrollableScrollPhysics(),
            itemBuilder:(context,value){
              //create variable
              final feature = features[value];
              return Padding(
                padding: const EdgeInsets.all(20),
                child:CustomListTileWithSubTitle(
                    title:feature.heading,
                    subTitle:feature.subheading,
                    leading:CustomIcon(icon:feature.icon,color:AppColor.blue,size:40),
                    function:(){}
                )
              );
            },
          ),
        )
      ],
    );
  }
}
