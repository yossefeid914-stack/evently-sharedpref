import 'package:flutter/material.dart';

class AppThemeProvider extends ChangeNotifier{
  ThemeMode appTheme=ThemeMode.light;
  ThemeMode? theme;

  void changeThemeLanguage(ThemeMode newTheme){
    if(appTheme==newTheme){
      return;
    }
    appTheme=newTheme;
    theme=appTheme;
    notifyListeners();
  }
bool isDarkMode(){
    return appTheme==ThemeMode.dark;
}

}