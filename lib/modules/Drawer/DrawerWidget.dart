import 'package:flutter/material.dart';
import 'package:news_shehab/modules/Setting/setting.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class DrawerWidget extends StatelessWidget {
  Function callBack;
  DrawerWidget(this.callBack);

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.menu),
                  SizedBox(
                    width: 10,
                  ),
                  Text(AppLocalizations.of(context)!.category,style: Theme.of(context).textTheme.headline1,),
                ],
              )),
          SizedBox(
            height: 40,
          ),
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, Setting.routeName);
            },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.settings),
                  SizedBox(
                    width: 10,
                  ),
                  Text(AppLocalizations.of(context)!.setting,style: Theme.of(context).textTheme.headline1,),
                ],
              )),
        ],
      ),
    );
  }
}
