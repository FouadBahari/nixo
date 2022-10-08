import 'package:flutter/material.dart';
import 'package:nixo/core/utils/app_colors.dart';
import 'package:nixo/core/utils/app_dimensions.dart';
import 'package:nixo/core/utils/app_styles.dart';

class PrimaryButtom extends StatelessWidget {
  String title;
  VoidCallback onPressed;
  PrimaryButtom({super.key, required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
      onPressed: onPressed,
      child: Text(
        title,
        style: getSemiBoldStyle(
            color: AppColors.black, fontSize: AppFontSize.font16),
      ),
    );
  }
}
