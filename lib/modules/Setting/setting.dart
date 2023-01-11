import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_shehab/Provider/myprovider.dart';
import 'package:provider/provider.dart';

import '../../shared/componant/languagesheet.dart';

class Setting extends StatelessWidget {
  static const String routeName = "";

  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<myprovider>(context);
    return Container(
      height: double.infinity,
        decoration:BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            fit: BoxFit.cover,
              image: AssetImage("assets/images/pattern.png",)),
        ),
        child:Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0.0,
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(17),
                bottomLeft: Radius.circular(17),
              ),
            ),
            title: Text(AppLocalizations.of(context)!.setting),
          ),
          body: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppLocalizations.of(context)!.language,style: Theme.of(context).textTheme.headline1,),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: (){
                    bottomsheet(context);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                     color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Theme.of(context).colorScheme.primary),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(pro.languagecode=="en"?"english":AppLocalizations.of(context)!.arabic),
                          Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
  Future bottomsheet(BuildContext context){
    return showModalBottomSheet(context: context,
        builder:(context){
      return languagemodal();
        });
  }
}
