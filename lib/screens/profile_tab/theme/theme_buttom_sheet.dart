import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/screens/provider/app_language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/app_theme_provider.dart';

class ThemeButtomSheet extends StatelessWidget {
  const ThemeButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    var themeProvider=Provider.of<AppThemeProvider>(context);
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: width*0.04,vertical: height*0.02),
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: height*0.02,
        children: [
          InkWell(
        onTap: (){
          themeProvider.changeThemeLanguage(ThemeMode.dark);
        },
            child: themeProvider.isDarkMode()?
            getSelectedItem(context: context,
                theme: AppLocalizations.of(context)!.dark):getUnSelectedItem(context: context, theme: AppLocalizations.of(context)!.dark)
          ),
          InkWell(
          onTap: (){
            themeProvider.changeThemeLanguage(ThemeMode.light);
          }
          ,child:themeProvider.isDarkMode()?
          getUnSelectedItem(context: context,
              theme: AppLocalizations.of(context)!.light):
          getSelectedItem(context: context, theme: AppLocalizations.of(context)!.light)
          ),


        ],
      ),
    );
  }
  Widget getSelectedItem({required BuildContext context,required String theme}){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(theme),
        Icon(Icons.check)
      ],
    );
  }
  Widget getUnSelectedItem({required BuildContext context,required String theme}){
    return Text(theme);
  }
}
