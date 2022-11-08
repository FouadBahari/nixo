import 'package:flutter/material.dart';
import 'package:nixo/core/utils/app_dimensions.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_styles.dart';

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
          color: AppColors.white, shadowColor: AppColors.primary, elevation: 4),
      // app bar theme
      appBarTheme: AppBarTheme(
          centerTitle: true,
          color: AppColors.primary,
          elevation: 4,
          shadowColor: AppColors.primary,
          titleTextStyle:
              getRegularStyle(fontSize: 16, color: AppColors.white)),
      // button theme
      buttonTheme: ButtonThemeData(
          shape: const StadiumBorder(),
          disabledColor: AppColors.primary,
          buttonColor: AppColors.primary,
          splashColor: AppColors.primary),

      // elevated button them
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              textStyle: getRegularStyle(color: AppColors.white, fontSize: 17),
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)))),
      textTheme: TextTheme(
          displayLarge:
              getSemiBoldStyle(color: AppColors.primary, fontSize: 16),
          headlineLarge:
              getSemiBoldStyle(color: AppColors.primary, fontSize: 16),
          headlineMedium:
              getRegularStyle(color: AppColors.primary, fontSize: 16),
          titleMedium: getMediumStyle(color: AppColors.primary, fontSize: 16),
          bodyLarge: getRegularStyle(color: AppColors.primary),
          bodySmall: getRegularStyle(color: AppColors.primary)),

      // input decoration theme (text form field)
      inputDecorationTheme: InputDecorationTheme(
        // content padding
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        // hint style

        filled: true,
        fillColor: AppColors.primary.withOpacity(0.3),
        border: InputBorder.none,
        hintStyle: getRegularStyle(color: AppColors.primary, fontSize: 14),
        labelStyle: getMediumStyle(color: AppColors.white, fontSize: 14),
        errorStyle: getRegularStyle(color: AppColors.primary),

        // enabled border style
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.white, width: 1.5),
            borderRadius: BorderRadius.all(Radius.circular(14))),

        // focused border style
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primary, width: 1.5),
            borderRadius: BorderRadius.all(Radius.circular(14))),

        // error border style
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.mistakes, width: 1.5),
            borderRadius: BorderRadius.all(Radius.circular(14))),
        // focused border style
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.mistakes, width: 1.5),
            borderRadius: BorderRadius.all(Radius.circular(14))),
      ),
      
      // timePickerTheme: TimePickerThemeData(
      //   backgroundColor: AppColors.navbarColor,
      //   dayPeriodBorderSide: BorderSide(color: AppColors.primary, width: 4),
      //   dayPeriodColor: AppColors.appBarIConColor,
        
      //   shape: RoundedRectangleBorder(
      //     borderRadius: const BorderRadius.all(Radius.circular(8)),
      //     side: BorderSide(color: AppColors.white, width: 0.5),
      //   ),

      //   dayPeriodTextColor: Colors.white,
      //   dayPeriodShape: RoundedRectangleBorder(
      //     borderRadius: const BorderRadius.all(Radius.circular(8)),
      //     side: BorderSide(color: AppColors.white, width: 0.5),
      //   ),
      //   hourMinuteColor: MaterialStateColor.resolveWith((states) =>
      //       states.contains(MaterialState.selected)
      //           ? AppColors.primary
      //           : AppColors.white),
      //   hourMinuteTextColor: MaterialStateColor.resolveWith((states) =>
      //       states.contains(MaterialState.selected)
      //           ? AppColors.primary
      //           : AppColors.white),
      //   dialHandColor: AppColors.appBarIConColor,
      //   dialBackgroundColor: AppColors.appBarIConColor,
      //   hourMinuteTextStyle:
      //       const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      //   dayPeriodTextStyle:
      //       const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      //   helpTextStyle: const TextStyle(
      //       fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
      //   inputDecorationTheme: const InputDecorationTheme(
      //     border: InputBorder.none,

      //     contentPadding: EdgeInsets.all(0),
      //   ),
      //   dialTextColor: MaterialStateColor.resolveWith((states) =>
      //       states.contains(MaterialState.selected)
      //           ? AppColors.primary
      //           : AppColors.white),
      //   entryModeIconColor: AppColors.primary,
      // )
      // // label style
      );
}
