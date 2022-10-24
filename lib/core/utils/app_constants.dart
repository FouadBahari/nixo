import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nixo/core/utils/app_colors.dart';
import 'package:nixo/core/utils/app_dimensions.dart';
import 'package:nixo/core/utils/app_strings.dart';
import 'package:nixo/core/utils/app_styles.dart';

import 'app_fonts.dart';

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
                fontSize: AppSize.font16,
              ),
            ),
            actions: [
              TextButton(
                onPressed: onPressed,
                style: TextButton.styleFrom(
                  textStyle: TextStyle(
                    color: AppColors.black,
                    fontSize: AppSize.font16,
                    fontWeight: FontWeightManager.bold,
                  ),
                ),
                child: const Text('Ok'),
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

  static Widget loadingIndicatorProgressBar({String? data}) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            backgroundColor: AppColors.primary,
          ),
          SizedBox(
            height: AppSize.height10,
          ),
          Text(
            data ?? AppStrings.settingUp,
            style: getMediumStyle(
                fontSize: AppSize.font16, color: AppColors.white),
          )
        ],
      ),
    );
  }

  static void snackBarNetwork(
      {String? msg, GlobalKey<ScaffoldState>? scaffoldState}) {
    ScaffoldMessenger.of(scaffoldState!.currentContext!).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text("$msg"), const Icon(Icons.warning)],
        ),
      ),
    );
  }

  static void snackBarWithProgress(
      {required String msg, required GlobalKey<ScaffoldState> scaffoldState}) {
    ScaffoldMessenger.of(scaffoldState.currentContext!).showSnackBar(SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            msg,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          const CircularProgressIndicator(),
        ],
      ),
    ));
  }

  Future<File?> pickOneImage() async {
    final result = await FilePicker.platform
        .pickFiles(type: FileType.image, allowMultiple: false);
    if (result != null) {
      return File(result.files.first.path!);
    }
    return null;
  }

  static bool isEmailValid(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());
    return regex.hasMatch(email);
  }

  static bool isPasswordValid(String password) => password.length > 6;
  static bool isUserNameValid(String username) => username.length > 6;
}
