import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../modules/Drawer/DrawerWidget.dart';
import '../modules/HomeCategory/HomeOfCategory.dart';

class HomeScreen extends StatelessWidget {
  static const String RouteName = "home";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          fit: BoxFit.cover,
            image: AssetImage("assets/images/pattern.png")),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25),
            ),
          ),
          title: Text(AppLocalizations.of(context)!.news),
        ),
        drawer: DrawerWidget(),
        body: HomeOfCategory(),
      ),
    );
  }
}
