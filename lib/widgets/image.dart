//import some libraries and files
import 'package:flutter/material.dart';

//custom image

//asset image
class CustomAssetImage extends StatelessWidget {
  //create variables
  final String url;
  final double ? height;
  final double ? width;
  final BoxFit ? fit;

  const CustomAssetImage(
      {super.key, required this.url, this.height, this.width, this.fit});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      url,
      height: height,
      width: width,
      fit: fit,
    );
  }
}


//asset image with alignment
class CustomAssetImageWithAlignment extends StatelessWidget {
  //create variables
  final String url;
  final double ? height;
  final double ? width;
  final BoxFit ? fit;
  final AlignmentGeometry align;

  const CustomAssetImageWithAlignment({super.key,required this.url,this.height,this.width,this.fit,required this.align});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      url,
      height:height,
      width:width,
      fit:fit,
      alignment:align,
    );
  }
}

//network image
class CustomNetworkImage extends StatelessWidget {
  //create variables
  final String url;
  final double ? height;
  final double ? width;
  final BoxFit ? fit;

  const CustomNetworkImage({super.key, required this.url, this.height, this.width, this.fit});
  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      height: height,
      width: width,
      fit: fit,
    );
  }
}


//network image with alignment
class CustomNetworkImageWithAlignment extends StatelessWidget {
  //create variables
  final String url;
  final double ? height;
  final double ? width;
  final BoxFit ? fit;
  final AlignmentGeometry align;

  const CustomNetworkImageWithAlignment({super.key,required this.url,this.height,this.width,this.fit,required this.align});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      height:height,
      width:width,
      fit:fit,
      alignment:align,
    );
  }
}