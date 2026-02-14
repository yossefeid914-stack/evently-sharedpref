import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/app_colors.dart';
import '../../provider/app_theme_provider.dart';

class DateOrTimeWidget extends StatelessWidget {
  Widget iconDateOrTime;
  String dateOrTimeText;
  String chooseDateOrTime;
  VoidCallback onChooseDateOrTime;
   DateOrTimeWidget({super.key,required this.iconDateOrTime,required this.dateOrTimeText,
     required this.chooseDateOrTime,required this.onChooseDateOrTime});

  @override
  Widget build(BuildContext context) {
    var themeProvider=Provider.of<AppThemeProvider>(context);

    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Row(
      spacing: width*0.04,
      children: [
        iconDateOrTime,
        Text(dateOrTimeText,style:
          Theme.of(context).textTheme.labelSmall,),
        Spacer(),
        TextButton(onPressed:onChooseDateOrTime , child: Text(chooseDateOrTime,
          style:themeProvider.isDarkMode()?AppStyles.regular12MainDark.copyWith(fontSize: 14,decoration: TextDecoration.underline,decorationColor: AppColors.mainDarkColor)
            :AppStyles.medium16MainColor.copyWith(fontSize: 14,decoration: TextDecoration.underline,decorationColor: AppColors.mainColor ,)))
      ],
    );
  }
}
