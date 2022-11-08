import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:nixo/core/utils/app_colors.dart';
import 'package:nixo/core/utils/app_dimensions.dart';
import 'package:nixo/core/utils/app_styles.dart';

class CalendarListTile extends StatelessWidget {
  String title;
  String suffixText;
  IconData prefixIcon;
  VoidCallback onTap;

  CalendarListTile({
    super.key,
    required this.title,
    required this.suffixText,
    required this.prefixIcon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.radius20),
      ),
      onTap: onTap,
      child: Ink(
        height: AppSize.height60,
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColors.boxColor,
            borderRadius: BorderRadius.circular(AppSize.radius20)),
        child: ListTile(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.radius20)),
          tileColor: AppColors.boxColor,
          leading: SizedBox(
            width: AppSize.width150,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Icon(
                    prefixIcon,
                    color: AppColors.appBarIConColor,
                  ),
                ),
                SizedBox(
                  width: AppSize.width5,
                ),
                Text(title,
                    style: getMediumStyle(
                        color: AppColors.white, fontSize: AppSize.font12)),
              ],
            ),
          ),
          trailing: SizedBox(
            width: AppSize.width100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  suffixText,
                  style: getSemiBoldStyle(
                      color: AppColors.white, fontSize: AppSize.font10),
                ),
                Icon(
                  Icons.clear,
                  color: AppColors.appBarIConColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
