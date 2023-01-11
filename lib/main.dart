import 'package:flutter/material.dart';
import 'package:news_shehab/Provider/myprovider.dart';
import 'package:news_shehab/layout/homeScreen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:news_shehab/modules/Setting/setting.dart';
import 'package:news_shehab/shared/styles/themes.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp( ChangeNotifierProvider(create: (BuildContext context) {
    return myprovider();
  },
  child: MyApp()));
}

class MyApp extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<myprovider>(context);
    return MaterialApp(
      localizationsDelegates: [
          AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'),
        Locale('ar'),
      ],
      locale:Locale(pro.languagecode),
      title: 'News App',
      debugShowCheckedModeBanner: false,
      routes: {
        Setting.routeName:(c)=>Setting(),
        HomeScreen.RouteName:(c)=>HomeScreen(),
      },
      initialRoute: HomeScreen.RouteName,
      theme: mythemedata.lightTheme,
      darkTheme: mythemedata.darktheme,
      themeMode: pro.themeMode,
    );
  }
}