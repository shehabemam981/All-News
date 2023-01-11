import 'package:flutter/material.dart';
import 'package:news_shehab/shared/styles/themes.dart';

class myprovider extends ChangeNotifier{
  String languagecode="en";
 ThemeMode themeMode=ThemeMode.light;
  void changeLanguage(String lang){
    languagecode=lang;
    notifyListeners();
  }
  void changeThemes(ThemeMode mode){
    themeMode=mode;
    notifyListeners();
  }


}