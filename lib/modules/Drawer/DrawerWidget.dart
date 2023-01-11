import 'package:flutter/material.dart';
import 'package:news_shehab/modules/Setting/setting.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

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
          Text(AppLocalizations.of(context)!.category,style: Theme.of(context).textTheme.headline1,),
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
