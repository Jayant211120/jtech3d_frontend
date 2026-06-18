//import some libraries and files
import 'package:flutter/material.dart';
import 'package:frontend/models/users/homePage/container_type_model_without_subheading.dart';
import 'package:frontend/widgets/container.dart';
import 'package:frontend/widgets/image.dart';

import '../../screens/scroll_behaviour.dart';
import '../../storage/colors.dart';
import '../../widgets/text.dart';

//stateless widget
class PopularCategories extends StatefulWidget {
  const PopularCategories({super.key});

  @override
  State<PopularCategories> createState() => _PopularCategoriesState();
}

class _PopularCategoriesState extends State<PopularCategories> {
  //create controllers
  final ScrollController _scrollController = ScrollController();

  //dispose state
  @override
  void dispose() {
   _scrollController.dispose();
    super.dispose();
  }
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
        SizedBox(
            height:300,
            child:Scrollbar(
              thumbVisibility:true,
              controller:_scrollController,
              child: ListView.builder(
                itemCount:features.length,
                scrollDirection:Axis.horizontal,
                itemBuilder:(context,value){
                  //create variable
                  final feature = features[value];
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child:Container(
                      //shape:BoxShape.rectangle,
                      color:AppColor.blueWithOpacityWithZeroPointZeroFour,
                      child:Column(
                        children: [
                          //image
                          CustomNetworkImage(url:feature.image,height:200,width:200,fit:BoxFit.cover),

                          //heading
                          CustomText(text:feature.heading,fontSize:20,fontWeight:FontWeight.bold)
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

        //content
        Padding(
          padding: const EdgeInsets.all(20),
          child: CustomText(text:"POPULAR CATEGORIES",fontSize:20,fontWeight:FontWeight.bold),
        )

      ],
    );
  }
}
