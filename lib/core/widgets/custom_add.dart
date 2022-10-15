import 'package:flutter/material.dart';
import 'package:nixo/core/utils/app_colors.dart';
import 'package:nixo/core/utils/app_dimensions.dart';

class CustomAddButton extends StatelessWidget {
  final double height;
  final double width;
  final double iconSize;
  const CustomAddButton(
      {super.key,
      required this.height,
      required this.width,
      required this.iconSize});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          side: BorderSide(color: AppColors.boxColor, width: AppSize.width3),
          backgroundColor: AppColors.boxColor2.withOpacity(0.12),
        ),
        onPressed: () {},
        child: Icon(
          Icons.add,
          size: iconSize,
          color: AppColors.white,
        ),
      ),
    );
  }
}
