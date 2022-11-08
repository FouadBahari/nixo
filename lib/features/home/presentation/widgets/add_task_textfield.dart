import 'package:flutter/material.dart';
import 'package:nixo/core/utils/app_colors.dart';
import 'package:nixo/core/utils/app_dimensions.dart';
import 'package:nixo/core/utils/app_styles.dart';

class AddTaskTextField extends StatelessWidget {
  String title;
  TextEditingController textController;
  TextInputType textInputType;
  int? maxLines;
  int? minLines;

  AddTaskTextField({
    super.key,
    required this.title,
    required this.textController,
    required this.textInputType,
    required this.maxLines,
    required this.minLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      keyboardType: textInputType,
      maxLines: maxLines,
      minLines: minLines,
      decoration: InputDecoration(
        labelText: title,
        alignLabelWithHint: true,
        labelStyle: getMediumStyle(color: AppColors.appBarIConColor),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: AppColors.transparent, width: AppSize.height1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.height15))),

        // focused border style
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: AppColors.transparent, width: AppSize.height1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.height15))),

        // error border style
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: AppColors.transparent, width: AppSize.height1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.height15))),
        // focused border style
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: AppColors.transparent, width: AppSize.height1_5),
            borderRadius: BorderRadius.all(Radius.circular(AppSize.height15))),
      ),
    );
  }
}
