import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme=ThemeData(
    cardColor: AppColors.mainColor,
    scaffoldBackgroundColor: AppColors.whiteBgColor,
    textTheme: TextTheme(
      headlineMedium: AppStyles.semi20Black,
        headlineSmall: AppStyles.regular14Grey,
      headlineLarge: AppStyles.medium16Black,
        labelLarge: AppStyles.medium16MainColor,
labelMedium: AppStyles.medium14Black,
        labelSmall: AppStyles.medium18Black

    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.whiteColor,
      selectedItemColor:AppColors.strokeDarkColor,
      unselectedItemColor: AppColors.greyColor,
      selectedLabelStyle: AppStyles.regular12Main,
      unselectedLabelStyle: AppStyles.regular12Grey,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.mainColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(30)
      )
    ),
        appBarTheme: AppBarTheme(
      backgroundColor: AppColors.mainColor,
          // shape: ,
  )
  );
  static final ThemeData darkTheme=ThemeData(
      cardColor: AppColors.mainDarkColor,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.mainDarkColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(30)
      )
  ),

      scaffoldBackgroundColor: AppColors.primaryDark,
      textTheme: TextTheme(
      headlineMedium: AppStyles.semi20White,
    headlineSmall: AppStyles.regular14DarkWhite,
    headlineLarge: AppStyles.medium16White,
        labelLarge: AppStyles.medium16White,
          labelMedium: AppStyles.medium14White,
        labelSmall: AppStyles.medium18White

      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.primaryDark,
      selectedItemColor:AppColors.mainDarkColor,
      unselectedItemColor: AppColors.greyColor,
    selectedLabelStyle: AppStyles.regular12Primary,
    unselectedLabelStyle: AppStyles.regular12Grey,
  ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primaryDark,
      )
  );


}