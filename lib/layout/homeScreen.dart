import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_shehab/models/Everything.dart';
import 'package:news_shehab/modules/HomeCategory/HomeOfCategory.dart';
import 'package:news_shehab/modules/HomeCategory/category/categoryItem.dart';
import 'package:news_shehab/modules/HomeCategory/searchscreen.dart';
import '../models/categorymodel.dart';
import '../modules/Drawer/DrawerWidget.dart';


class HomeScreen extends StatefulWidget {
  static const String RouteName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:(selectedcategory!=null)? IconButton(
                  onPressed: (){
                Navigator.pushReplacementNamed(context, searchscreen.routename);
              }, icon: Icon(Icons.search)):SizedBox(),
            )
          ],
        ),
        drawer: DrawerWidget(selectedDrawer),
        body:(selectedcategory==null)? categoryItem(selecetedcategorycallback):HomeOfCategory(selectedcategory!),
      ),
    );
  }

  category? selectedcategory=null;

  void selecetedcategorycallback(category categoree){
      selectedcategory=categoree;
     setState((){});
  }
  void selectedDrawer(){

    selectedcategory=null;
    setState((){
      Navigator.pop(context);
    }
    );
  }

}
