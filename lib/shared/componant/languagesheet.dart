import 'package:flutter/material.dart';
import 'package:news_shehab/Provider/myprovider.dart';
import 'package:news_shehab/shared/componant/showMasseges.dart';
import 'package:provider/provider.dart';


class languagemodal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<myprovider>(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: (){
              pro.changeLanguage("en");
              hideLoading(context);
            },
              child: items(context, "english", pro.languagecode=="en")),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap:
            (){
              pro.changeLanguage("ar");
              hideLoading(context);
            },
              child: items(context, "arabic", pro.languagecode=="ar")),
        ],
      ),
    );
  }
  Widget items( BuildContext context,String name,bool isSelected){
    return  Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        color: (isSelected)?Colors.grey:Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: Theme.of(context).textTheme.headline1?.copyWith(
                color: Colors.black,
              ),
            ),
            Icon(Icons.done),
          ],
        ),
      ),
    );
  }
}
