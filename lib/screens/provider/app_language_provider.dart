import 'package:flutter/material.dart';

class AppLanguageProvider extends ChangeNotifier {

  String appLanguage='en';
  String?language;
void changeLanguage(String newLanguage){
  if(appLanguage==newLanguage){
    return;
  }
  appLanguage=newLanguage;
  language=appLanguage;
  notifyListeners();
}




}