
import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_fonts.dart';
import '../../core/utils/app_styles.dart';
import '../../core/utils/app_dimensions.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // main colors
    primaryColor: AppColors.primary,
    primaryColorLight: AppColors.primary,
    primaryColorDark: AppColors.primary,
    disabledColor: AppColors.primary,
    splashColor: AppColors.primary,
    // ripple effect color
    // cardview theme
    cardTheme: CardTheme(
        color: AppColors.white,
        shadowColor: AppColors.primary,
        elevation: AppSize.s4),
    // app bar theme
    appBarTheme: AppBarTheme(
        centerTitle: true,
        color: AppColors.primary,
        elevation: AppSize.s4,
        shadowColor: AppColors.primary,
        titleTextStyle:
            getRegularStyle(fontSize: FontSize.s16, color: AppColors.white)),
    // button theme
    buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: AppColors.primary,
        buttonColor: AppColors.primary,
        splashColor: AppColors.primary),

    // elevated button them
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: getRegularStyle(
                color: AppColors.white, fontSize: FontSize.s17),
            primary: AppColors.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s12)))),

    textTheme: TextTheme(
        displayLarge: getSemiBoldStyle(
            color: AppColors.primary, fontSize: FontSize.s16),
        headlineLarge: getSemiBoldStyle(
            color: AppColors.primary, fontSize: FontSize.s16),
        headlineMedium: getRegularStyle(
            color: AppColors.primary, fontSize: FontSize.s14),
        titleMedium: getMediumStyle(
            color: AppColors.primary, fontSize: FontSize.s16),
        bodyLarge: getRegularStyle(color: AppColors.primary),
        bodySmall: getRegularStyle(color: AppColors.primary)),

    // input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
        // content padding
        contentPadding: const EdgeInsets.all(AppPadding.p8),
        // hint style
        hintStyle:
            getRegularStyle(color: AppColors.primary, fontSize: FontSize.s14),
        labelStyle:
            getMediumStyle(color: AppColors.primary, fontSize: FontSize.s14),
        errorStyle: getRegularStyle(color: AppColors.primary),

        // enabled border style
        enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: AppColors.primary, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),

        // focused border style
        focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: AppColors.primary, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),

        // error border style
        errorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: AppColors.primary, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
        // focused border style
        focusedErrorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: AppColors.primary, width: AppSize.s1_5),
            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)))),
    // label style
  );
}