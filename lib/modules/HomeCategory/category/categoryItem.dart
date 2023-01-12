import 'package:flutter/material.dart';
import 'package:news_shehab/models/categorymodel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'categoryoneitem.dart';

class categoryItem extends StatefulWidget {
 Function callback;
 categoryItem(this.callback);

  @override
  State<categoryItem> createState() => _categoryItemState();
}

class _categoryItemState extends State<categoryItem> {
 @override
  Widget build(BuildContext context) {
    var categories=category.getcategory(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(AppLocalizations.of(context)!.pick,style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold
            ),),
          ),
          Expanded(
            child: GridView.builder(
                gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ) ,
                itemCount:categories.length,
                itemBuilder:(context,index){
              return   InkWell(
                onTap: (){
                  widget.callback(categories[index]);
                  setState((){});
                },
                child: categoryoneitem(
                    index,categories[index]
                  ),
              );
            }),
          )
        ],
      )
    );
  }
}
