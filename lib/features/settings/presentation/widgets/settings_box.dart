import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nixo/core/utils/app_colors.dart';
import 'package:nixo/core/utils/app_dimensions.dart';
import 'package:nixo/core/utils/app_styles.dart';

class SettingsBox extends StatelessWidget {
  final IconData icon;
  final String title;

  const SettingsBox({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: AppSize.m12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: Size(double.infinity, AppSize.height66),
            backgroundColor: AppColors.boxColor),
        onPressed: () {},
        child: Row(
          children: [
            Icon(size: AppSize.height23, icon),
            SizedBox(
              width: AppSize.width15,
            ),
            Text(
              title,
              style: getSemiBoldStyle(
                  color: AppColors.white, fontSize: AppSize.font14),
            ),
          ],
        ),
      ),
    );
  }
}
