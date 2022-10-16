import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nixo/core/utils/app_colors.dart';
import 'package:nixo/core/utils/app_dimensions.dart';

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
          const CircularProgressIndicator(
            backgroundColor: Colors.orange,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            data ?? "Setting up your account please wait..",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
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

  static void snackBar(
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

  void push({required BuildContext context, required Widget widget}) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => widget));
  }

  void toast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  Widget verticalDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 18,
      width: 1.0,
      decoration: BoxDecoration(color: Colors.black.withOpacity(.4)),
    );
  }
}
