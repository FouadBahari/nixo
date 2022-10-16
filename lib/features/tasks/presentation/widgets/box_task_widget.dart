import 'package:flutter/material.dart';
import 'package:nixo/core/utils/app_colors.dart';
import 'package:nixo/core/utils/app_dimensions.dart';
import 'package:nixo/core/utils/app_styles.dart';

class BoxTask extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color backboxColor;
  VoidCallback onpressed;

  BoxTask(
      {super.key,
      required this.icon,
      required this.title,
      required this.onpressed,
      this.backboxColor = const Color(0xFF295070)});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backboxColor,
        fixedSize: Size(AppSize.width150, AppSize.height150),
      ),
      onPressed: onpressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: AppSize.height80,
            color: AppColors.white,
          ),
          SizedBox(
            height: AppSize.height10,
          ),
          Text(title,
              textAlign: TextAlign.center,
              style: getSemiBoldStyle(
                  color: AppColors.white, fontSize: AppSize.font17)),
        ],
      ),
    );
  }
}
