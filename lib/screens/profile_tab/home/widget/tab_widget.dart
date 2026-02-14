import 'package:evently/screens/provider/app_theme_provider.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabWidget extends StatelessWidget {
  bool isSelected;
  String eventName;
  Color selectedColor;
  Color selectedBorderColor;
  Color unselectedColor;
  Color unselectedBorderColor;
  TextStyle? selectedTextStyle;
  TextStyle? unselectedTextStyle;
   TabWidget({super.key,required this.eventName,required this.isSelected,required this.selectedColor,
     required this.unselectedColor,required this.selectedBorderColor,required this.unselectedBorderColor,required this.selectedTextStyle,required this.unselectedTextStyle});

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    var themeProvider=Provider.of<AppThemeProvider>(context);

    return Container(
      padding: EdgeInsets.symmetric(vertical: height*0.01,horizontal: width*0.04),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: isSelected?
            selectedColor
            // AppColors.mainDarkColor:AppColors.whiteColor:AppColors.transparentColor,
            :unselectedColor,
        // AppColors.whiteColor:AppColors.transparentColor,
        border: Border.all(
          color: isSelected ?
         selectedBorderColor:unselectedBorderColor,
              width: 2
        )
      ),
      child: Text(eventName,style: isSelected?selectedTextStyle:unselectedTextStyle,),
    );
  }
}
