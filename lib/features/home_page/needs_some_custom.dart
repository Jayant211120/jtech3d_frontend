//import some libraries and files
import 'package:flutter/material.dart';
import 'package:frontend/widgets/container.dart';
import 'package:frontend/widgets/image.dart';

import '../../storage/colors.dart';
import '../../widgets/button.dart';
import '../../widgets/text.dart';

//stateless widget
class NeedSomeCustom extends StatelessWidget {
  const NeedSomeCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Stack(
        alignment:AlignmentDirectional.center,
        children: [
          //container
          Padding(
            padding: const EdgeInsets.all(10),
            child: CustomNetworkImage(
              url:"https://mtxlaser.com/wp-content/uploads/2025/02/dual-extrusion-3d-prints.jpg",
              fit:BoxFit.fill,
              height:250,
              width:double.infinity,
            ),
          ),

          //background color
          Padding(
            padding: const EdgeInsets.all(10),
            child: CustomContainer(
              shape:BoxShape.rectangle,
              height:250,
              width:double.infinity,
              color:AppColor.blackWithOpacityWithZeroPointSix,
            ),
          ),

          //content
          Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              //heading
              Padding(
                padding: const EdgeInsets.all(5),
                child: CustomText(text:"Needs something custom?",color:AppColor.white,fontSize:20,fontWeight:FontWeight.bold),
              ),

              //subheading
              Padding(
                padding: const EdgeInsets.all(5),
                child: CustomText(text:"Our experts are here to bring your ideas to life",color:AppColor.white),
              ),

              //button
              Padding(
                padding: const EdgeInsets.all(5),
                child: ClipRRect(
                  borderRadius:BorderRadius.circular(5),
                  child: CustomTextButton(
                    text:"Upload Data",
                    textColor:AppColor.white,
                    containerColor:AppColor.blue,

                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
