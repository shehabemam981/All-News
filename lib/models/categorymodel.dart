import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class category{
  String? id;
  String? name;
  String? image;

  Color? Colors;
  category(this.id,
      this.name,
      this.image,
      this.Colors);
  static List<category> getcategory(context){
    return[
      category("sports",AppLocalizations.of(context)!.sports
          ,"assets/images/sports.png",Color(0xFFC91C22)),
      category("entertainment",AppLocalizations.of(context)!.enter
          ,"assets/images/Politics.png",Color(0xFFF2D352)),
      category("business",AppLocalizations.of(context)!.business
          ,"assets/images/bussines.png",Color(0xFFCF7E48)),
      category("general",AppLocalizations.of(context)!.general
          ,"assets/images/environment.png",Color(0xFF4882CF)),
      category("health",AppLocalizations.of(context)!.health
          ,"assets/images/health.png",Color(0xFFED1E79)),
      category("science",AppLocalizations.of(context)!.science
          ,"assets/images/science.png",Color(0xFFF2D352)),
      category("technology",AppLocalizations.of(context)!.techno
          ,"assets/images/environment.png",Color(0xFF4882CF)),
  ];}
}