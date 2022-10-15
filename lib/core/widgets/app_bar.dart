import 'package:flutter/material.dart';
import 'package:nixo/core/utils/app_colors.dart';

buildAppBar(onPressed,IconData icon){
  return AppBar(
      leading: IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: AppColors.appBarIConColor.withOpacity(0.7),
          )),
      actions: [
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: AppColors.appBarIConColor.withOpacity(0.7),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_outlined,
                color: AppColors.appBarIConColor.withOpacity(0.7),
              ),
            )
          ],
        )
      ],
      backgroundColor: AppColors.system,
      elevation: 0,
    );
}