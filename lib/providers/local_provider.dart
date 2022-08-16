import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider extends ChangeNotifier{
    String locale = 'en';
    ThemeMode mode = ThemeMode.light;
    LocaleProvider(){
      init();
    }
    void init(){
      print('INIT');
      getLocalFromPrefs();
      getModeFromPrefs();
    }
    changeLanguage(String newLanguage){
      locale = newLanguage;
      updateLocale(newLanguage);
      notifyListeners();
    }
    changeMode(ThemeMode themeMode){
      if(themeMode==mode) return;
      mode = themeMode;
      updateMode(mode);
      notifyListeners();
    }
    void updateLocale(String newLocale)async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('locale', newLocale);
    }
    void updateMode(ThemeMode newMode)async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      newMode==ThemeMode.light?await prefs.setBool('mode', false):await prefs.setBool('mode', true);
    }

    void getLocalFromPrefs(){
      SharedPreferences.getInstance().then((value){
        locale = value.getString('locale')??'en';
        notifyListeners();
        print(locale);
      }
      );
    }
    void getModeFromPrefs(){
      SharedPreferences.getInstance().then((value){
        bool dark = value.getBool('mode')??false;
        print(dark);
        if(dark){
          mode = ThemeMode.dark;
        }else{
          mode = ThemeMode.light;
        }
        notifyListeners();
      });
    }
}