//import some libraries and files
import 'package:flutter/material.dart';
import 'package:frontend/models/users/homePage/container_type_model_without_subheading.dart';
import 'package:frontend/widgets/container.dart';
import 'package:frontend/widgets/image.dart';

import '../../storage/colors.dart';
import '../../widgets/text.dart';

//stateless widget
class PopularCategories extends StatelessWidget {
  const PopularCategories({super.key});

  @override
  Widget build(BuildContext context) {
    //create variable list
    final List<ContainerTypeModelWithoutSubheading> features = [
      ContainerTypeModelWithoutSubheading(
          image:"https://tse3.mm.bing.net/th/id/OIP.ameuZioNcqTEW_wSxnCHkQHaHa?rs=1&pid=ImgDetMain&o=7&rm=3",
          heading:"Check"
      ),
      ContainerTypeModelWithoutSubheading(
          image:"https://tse3.mm.bing.net/th/id/OIP.ameuZioNcqTEW_wSxnCHkQHaHa?rs=1&pid=ImgDetMain&o=7&rm=3",
          heading:"Check"
      ),
      ContainerTypeModelWithoutSubheading(
          image:"https://tse3.mm.bing.net/th/id/OIP.ameuZioNcqTEW_wSxnCHkQHaHa?rs=1&pid=ImgDetMain&o=7&rm=3",
          heading:"Check"
      ),
      ContainerTypeModelWithoutSubheading(
          image:"https://tse3.mm.bing.net/th/id/OIP.ameuZioNcqTEW_wSxnCHkQHaHa?rs=1&pid=ImgDetMain&o=7&rm=3",
          heading:"Check"
      ),
      ContainerTypeModelWithoutSubheading(
          image:"https://tse3.mm.bing.net/th/id/OIP.ameuZioNcqTEW_wSxnCHkQHaHa?rs=1&pid=ImgDetMain&o=7&rm=3",
          heading:"Check"
      ),
      ContainerTypeModelWithoutSubheading(
          image:"https://tse3.mm.bing.net/th/id/OIP.ameuZioNcqTEW_wSxnCHkQHaHa?rs=1&pid=ImgDetMain&o=7&rm=3",
          heading:"Check"
      ),
      ContainerTypeModelWithoutSubheading(
          image:"https://tse3.mm.bing.net/th/id/OIP.ameuZioNcqTEW_wSxnCHkQHaHa?rs=1&pid=ImgDetMain&o=7&rm=3",
          heading:"Check"
      ),
      ContainerTypeModelWithoutSubheading(
          image:"https://tse3.mm.bing.net/th/id/OIP.ameuZioNcqTEW_wSxnCHkQHaHa?rs=1&pid=ImgDetMain&o=7&rm=3",
          heading:"Check"
      ),
      ContainerTypeModelWithoutSubheading(
          image:"https://tse3.mm.bing.net/th/id/OIP.ameuZioNcqTEW_wSxnCHkQHaHa?rs=1&pid=ImgDetMain&o=7&rm=3",
          heading:"Check"
      ),
    ];

    return Column(
      children: [
        //heading
        Padding(
          padding: const EdgeInsets.all(20),
          child: CustomText(text:"POPULAR CATEGORIES",fontSize:20,fontWeight:FontWeight.bold),
        ),

        //content
        Wrap(
          spacing:15,
          runSpacing:20,
          direction:Axis.horizontal,
          children:features.map((feature){
            return CustomContainer(
              shape:BoxShape.rectangle,
              color:AppColor.blueWithOpacityWithZeroPointZeroFour,
              child:Column(
                children: [
                  //image
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: CustomNetworkImage(
                      url:feature.image,
                      fit:BoxFit.cover,
                      height:200,
                      width:200,
                    ),
                  ),

                  //heading
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: CustomText(text:"Check",fontSize:20,fontWeight:FontWeight.bold),
                  )
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
