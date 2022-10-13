import 'package:flutter/material.dart';

class AppSize {
  static double screenHeight = 0;
  static double screenWidth = 0;

  static getScreenSize(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
  }

  static double factorHeight = screenHeight / 844;
  static double factorwidth = screenWidth / 390;

  static double height1_5 = 1.5 * factorHeight;
  static double height2 = 2 * factorHeight;
  static double height4 = 4 * factorHeight;
  static double height5 = 5 * factorHeight;
  static double height8 = 8 * factorHeight;
  static double height10 = 10 * factorHeight;
  static double height12 = 12 * factorHeight;
  static double height15 = 15 * factorHeight;
  static double height18 = 18 * factorHeight;
  static double height20 = 20 * factorHeight;
  static double height22 = 22 * factorHeight;
  static double height25 = 25 * factorHeight;
  static double height30 = 30 * factorHeight;
  static double height35 = 35 * factorHeight;
  static double height40 = 40 * factorHeight;
  static double height45 = 45 * factorHeight;
  static double height50 = 50 * factorHeight;
  static double height55 = 55 * factorHeight;
  static double height60 = 60 * factorHeight;
  static double height61 = 61 * factorHeight;
  static double height62 = 62 * factorHeight;
  static double height80 = 80 * factorHeight;
  static double height100 = 100 * factorHeight;
  static double height120 = 120 * factorHeight;
  static double height140 = 140 * factorHeight;
  static double height150 = 150 * factorHeight;
  static double height180 = 180 * factorHeight;
  static double height200 = 200 * factorHeight;
  static double height300 = 300 * factorHeight;
  static double height400 = 400 * factorHeight;
  static double height500 = 500 * factorHeight;

  //

  static double width1 = 1 * factorwidth;
  static double width2 = 2 * factorwidth;
  static double width5 = 5 * factorwidth;
  static double width8 = 8 * factorwidth;
  static double width10 = 10 * factorwidth;
  static double width15 = 15 * factorwidth;
  static double width20 = 20 * factorwidth;
  static double width24 = 24 * factorwidth;
  static double width25 = 25 * factorwidth;
  static double width30 = 30 * factorwidth;
  static double width35 = 35 * factorwidth;
  static double width40 = 40 * factorwidth;
  static double width45 = 45 * factorwidth;
  static double width50 = 50 * factorwidth;
  static double width60 = 60 * factorwidth;
  static double width100 = 100 * factorwidth;
  static double width120 = 120 * factorwidth;
  static double width150 = 150 * factorwidth;

  //
  static double radius10 = 10 * factorHeight;
  static double radius14 = 14 * factorHeight;
  static double radius15 = 15 * factorHeight;
  static double radius20 = 20 * factorHeight;
  static double radius25 = 25 * factorHeight;
  static double radius30 = 30 * factorHeight;
  static double radius35 = 35 * factorHeight;

  //font
  static double font8 = 8 * factorHeight;
  static double font10 = 10 * factorHeight;
  static double font12 = 12 * factorHeight;
  static double font14 = 14 * factorHeight;
  static double font15 = 15 * factorHeight;
  static double font16 = 16 * factorHeight;
  static double font17 = 17 * factorHeight;
  static double font19 = 19 * factorHeight;
  static double font20 = 20 * factorHeight;
  static double font21 = 21 * factorHeight;
  static double font22 = 22 * factorHeight;
  static double font25 = 25 * factorHeight;
  static double font30 = 30 * factorHeight;
  static double font46 = 46 * factorHeight;

  //margins
  static double m8 = 8.0 * factorHeight;
  static double m12 = 12.0 * factorHeight;
  static double m14 = 14.0 * factorHeight;
  static double m16 = 16.0 * factorHeight;
  static double m18 = 18.0 * factorHeight;
  static double m20 = 20.0 * factorHeight;
  static double m24 = 24.0 * factorHeight;
  static double m30 = 30.0 * factorHeight;
  static double m40 = 40.0 * factorHeight;
  static double m50 = 50.0 * factorHeight;

  //padding

  static double p8 = 8.0 * factorHeight;
  static double p12 = 12.0 * factorHeight;
  static double p14 = 14.0 * factorHeight;
  static double p16 = 16.0 * factorHeight;
  static double p18 = 18.0 * factorHeight;
  static double p20 = 20.0 * factorHeight;
  static double p24 = 24.0 * factorHeight;
}
