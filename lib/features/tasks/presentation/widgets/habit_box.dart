import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:nixo/core/utils/app_colors.dart';
import 'package:nixo/core/utils/app_dimensions.dart';
import 'package:nixo/core/utils/app_styles.dart';

class HabitTrackerBox extends StatelessWidget {
  HabitTrackerBox(
      {super.key,
      required this.name,
      required this.streak,
      required this.isChecked,
      required this.hour,
      required this.timing});
  String name;
  String hour;
  String timing;
  String streak;
  bool isChecked;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.height80,
      margin: EdgeInsets.only(bottom: AppSize.m12),
      child: ClipRRect(
        clipBehavior: Clip.hardEdge,
        child: Slidable(
          endActionPane: ActionPane(motion: const ScrollMotion(), children: [
            SlidableAction(
              spacing: 5,
              onPressed: (context) {},
              backgroundColor: AppColors.mistakes,
              icon: Icons.delete_forever_rounded,
            ),
          ]),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.boxColor,
                    borderRadius: BorderRadius.circular(AppSize.radius20),
                  ),
                  child: ListTile(
                    iconColor: AppColors.success,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSize.radius20),
                    ),
                    title: Text(
                      name,
                      style: getSemiBoldStyle(
                          color: AppColors.white, fontSize: AppSize.font14),
                    ),
                    subtitle: Text(
                      streak,
                      style: getLightStyle(
                        color: AppColors.white,
                        fontSize: AppSize.font10,
                      ),
                    ),
                    tileColor: AppColors.boxColor,
                    leading: isChecked
                        ? Icon(
                            Icons.check_circle_rounded,
                            color: AppColors.success,
                          )
                        : Icon(
                            Icons.check_circle_outline_rounded,
                            color: AppColors.success.withOpacity(0.20),
                          ),
                    trailing: SizedBox(
                      width: AppSize.width100,
                      child: Row(
                        children: [
                          SizedBox(
                            width: AppSize.width5,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: AppSize.width5,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(hour,
                      style: getMediumStyle(
                          color: AppColors.primary, fontSize: AppSize.font12)),
                  SizedBox(
                    height: AppSize.height5,
                  ),
                  Text(
                    timing,
                    style: getMediumStyle(
                      color: AppColors.primary,
                      fontSize: AppSize.font12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
