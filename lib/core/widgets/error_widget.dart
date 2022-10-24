import 'package:flutter/material.dart';
import 'package:nixo/core/utils/app_colors.dart';
import 'package:nixo/core/utils/app_dimensions.dart';
import 'package:nixo/core/utils/app_strings.dart';
import 'package:nixo/core/utils/mediaquery_values.dart';

class ErrorScreen extends StatelessWidget {
  final VoidCallback? onPress;
  const ErrorScreen({Key? key, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Icon(
            Icons.warning_amber_rounded,
            color: AppColors.primary,
            size: AppSize.height150,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: AppSize.m12),
          child: Text(
            AppStrings.somethingWentWrong,
            style: TextStyle(
                color: AppColors.white,
                fontSize: AppSize.font20,
                fontWeight: FontWeight.w700),
          ),
        ),
        Text(
          AppStrings.pleaseTryAgain,
          style: TextStyle(
              color: AppColors.hint,
              fontSize: AppSize.font18,
              fontWeight: FontWeight.w500),
        ),
        Container(
          height: AppSize.height55,
          width: MediaQuery.of(context).size.width * 0.55,
          margin: EdgeInsets.symmetric(vertical: AppSize.m16),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.white,
                elevation: AppSize.height500,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSize.radius50))),
            child: Text(
              AppStrings.reloadScreen,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: AppSize.font20,
                  fontWeight: FontWeight.w700),
            ),
            onPressed: () {
              if (onPress != null) {
                onPress!();
              }
            },
          ),
        )
      ],
    );
  }
}
