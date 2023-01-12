import 'package:flutter/material.dart';
import 'package:news_shehab/modules/Setting/setting.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../models/categorymodel.dart';
class DrawerWidget extends StatelessWidget {
  Function callBack;
  DrawerWidget(this.callBack);

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: Column(
        children: [
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width*30,
            color: Theme.of(context).colorScheme.primary,
          ),
          SizedBox(
            height: 40,
          ),
          InkWell(
               onTap: (){
                 callBack();
               },
              child: Text(AppLocalizations.of(context)!.category,style: Theme.of(context).textTheme.headline1,)),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, Setting.routeName);
            },
              child: Text(AppLocalizations.of(context)!.setting,style: Theme.of(context).textTheme.headline1,)),
        ],
      ),
    );
  }
}
