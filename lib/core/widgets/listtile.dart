import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:nixo/core/utils/app_colors.dart';
import 'package:nixo/core/utils/app_dimensions.dart';
import 'package:nixo/core/utils/app_styles.dart';

class ToDoItemWidget extends StatelessWidget {
  String name;
  String catName;
  String hour;
  String timing;
  bool isChecked;

  ToDoItemWidget(
      {super.key,
      required this.name,
      required this.catName,
      required this.hour,
      required this.isChecked,
      required this.timing});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.height62,
      margin: EdgeInsets.only(
          left: AppSize.m24, right: AppSize.m24, bottom: AppSize.m12),
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
                      borderRadius: BorderRadius.circular(AppSize.radius20)),

                  child: ListTile(
                    iconColor: AppColors.success,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSize.radius20)),
                    title: Text(name,
                        style: getSemiBoldStyle(
                            color: AppColors.white, fontSize: AppSize.font14)),
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
                    trailing: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSize.radius10),
                        color: AppColors.mistakes,
                      ),
                      height: AppSize.height22,
                      width: AppSize.width60,
                      child: Text(
                        catName,
                        style: getSemiBoldStyle(
                            color: AppColors.redTitle,
                            fontSize: AppSize.font10),
                      ),

 

                    ),
                  ),
                ),
              ),
              SizedBox(
                width: AppSize.width5,
              ),
              Column(
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
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
