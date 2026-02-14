import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/screens/profile_tab/language/language_buttom_sheet.dart';
import 'package:evently/screens/profile_tab/theme/theme_buttom_sheet.dart';
import 'package:evently/screens/profile_tab/widget/settings_item.dart';
import 'package:evently/screens/provider/app_language_provider.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/app_theme_provider.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  bool isDark=false;
  @override
  Widget build(BuildContext context) {
    var languageProvider=Provider.of<AppLanguageProvider>(context);
    var themeProvider=Provider.of<AppThemeProvider>(context);
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return SafeArea(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal:width*0.04,vertical: height*0.04 ),
        child: Column(
          spacing: height*0.02,
          children: [
            Image.asset(AppAssets.routeLogo),
            Text('Route Academy',style: Theme.of(context).textTheme.headlineMedium,),
            Text('route@gmail.com',style: Theme.of(context).textTheme.headlineSmall,),
            SettingsItem(text:AppLocalizations.of(context)!.dark_mode
              ,
                icon: Switch(
                   inactiveThumbColor: AppColors.greyColor ,
                activeThumbColor: AppColors.mainDarkColor,
                value: isDark, onChanged:(selected){
                  isDark=selected;
                  themeProvider.changeThemeLanguage(isDark==true?ThemeMode.dark:
                  ThemeMode.light);
                  setState(() {

                  });
                }),
                iconColor: Theme.of(context).cardColor,

                decorationColor: themeProvider.isDarkMode()?AppColors.transparentColor:AppColors.whiteColor,
                borderColor: themeProvider.isDarkMode()?AppColors.strokeDarkColor
                    : AppColors.strokeColor,),
            SettingsItem(text: languageProvider.language==null?
            AppLocalizations.of(context)!.language:
            languageProvider.language! =='en'?
            AppLocalizations.of(context)!.english:
            AppLocalizations.of(context)!.arabic,
                icon: Icon(Icons.arrow_forward_ios_outlined),
                iconColor: Theme.of(context).cardColor,
                onPressed: showLangugeButtomSheet,
                decorationColor: themeProvider.isDarkMode()?AppColors.transparentColor:AppColors.whiteColor,
                borderColor: themeProvider.isDarkMode()?AppColors.strokeDarkColor
                    : AppColors.strokeColor,),
            SettingsItem(text:
            AppLocalizations.of(context)!.logout,
                icon: Icon(Icons.logout),
                iconColor: AppColors.redColor,
                onPressed: (){},
                decorationColor: themeProvider.isDarkMode()?AppColors.transparentColor:AppColors.whiteColor,
                borderColor: themeProvider.isDarkMode()?AppColors.strokeDarkColor
                    : AppColors.strokeColor,),
          ],
        ),
      ),
    );
  }

  void showLangugeButtomSheet( ) {
    showModalBottomSheet(context: context,
        builder: (context)=>LanguageButtomSheet()
    );
  }

  void showThemeButtomSheet() {
    showModalBottomSheet(context: context,
        builder: (context)=>ThemeButtomSheet()
    );
  }
}
