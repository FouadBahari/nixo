import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nixo/core/utils/app_colors.dart';
import 'package:nixo/core/utils/app_fonts.dart';

class AppConstants {
  static const int splashDelay = 3;
  static const int sliderAnimationTime = 300;

  static void showErrorDialog(
      {required BuildContext context,
      required String msg,
      required VoidCallback onPressed}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              msg,
              style: TextStyle(
                color: AppColors.black,
                fontSize: FontSize.s16,
              ),
            ),
            actions: [
              TextButton(
                onPressed: onPressed,
                style: TextButton.styleFrom(
                  textStyle: TextStyle(
                    color: AppColors.black,
                    fontSize: FontSize.s14,
                    fontWeight: FontWeightManager.bold,
                  ),
                ),
                child: const Text('ok'),
              )
            ],
          );
        });
  }

  static void showToast(
      {required String msg, Color? color, ToastGravity? gravity}) {
    Fluttertoast.showToast(
        toastLength: Toast.LENGTH_LONG,
        msg: msg,
        backgroundColor: color ?? AppColors.primary,
        gravity: gravity ?? ToastGravity.BOTTOM);
  }
}
