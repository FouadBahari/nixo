import 'package:flutter/material.dart';
import 'package:nixo/core/utils/app_assets.dart';
import 'package:nixo/core/utils/app_colors.dart';
import 'package:nixo/core/utils/app_dimensions.dart';
import 'package:nixo/core/utils/app_strings.dart';
import 'package:nixo/core/utils/app_styles.dart';

class OverviewCard extends StatelessWidget {
  const OverviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        margin: EdgeInsets.only(bottom: AppSize.height10),
        padding: EdgeInsets.all(AppSize.height20),
        height: AppSize.height160,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(AppSize.radius20)),
            image: const DecorationImage(
                image: AssetImage(AssetsManager.overviewCard),
                fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              AppStrings.priorityTaskProgress,
              style: getBoldStyle(
                  color: AppColors.system, fontSize: AppSize.font17),
            ),
            Text(
              '3/5 ${AppStrings.completed}',
              style: getMediumStyle(
                  color: AppColors.system, fontSize: AppSize.font17),
            ),
            Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.all(Radius.circular(AppSize.radius10)),
                    child: LinearProgressIndicator(
                      value: 0.5,
                      color: AppColors.system,
                      backgroundColor: AppColors.appBarIConColor,
                      minHeight: AppSize.font15,
                    ),
                  ),
                ),
                SizedBox(
                  width: AppSize.width10,
                ),
                Text(
                  '% 50',
                  style: getMediumStyle(
                      color: AppColors.system, fontSize: AppSize.font17),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
