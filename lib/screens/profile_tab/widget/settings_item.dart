import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../l10n/app_localizations.dart';
import '../../../utils/app_colors.dart';
import '../../provider/app_language_provider.dart';
import '../../provider/app_theme_provider.dart';

class SettingsItem extends StatelessWidget {
  String text;
  Widget icon;
  VoidCallback? onPressed;
  Color? iconColor;
  Color decorationColor;
  Color borderColor;
   SettingsItem({super.key,required this.text,required this.icon,
      this.onPressed,this.iconColor,required this.decorationColor,required this.borderColor});

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;

    return    Container(
      padding: EdgeInsets.symmetric(horizontal: width*0.04),
      decoration: BoxDecoration(
          color: decorationColor,
          border: Border.all(
          color:borderColor  ,
          width: 2
      ),
          borderRadius: BorderRadius.circular(16)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          IconButton(onPressed:onPressed ,icon: icon,color: iconColor,)
        ],
      ),
    )
    ;
  }
}
