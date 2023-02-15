import 'package:flutter/material.dart';
import 'package:news_shehab/models/Everything.dart';
import 'package:news_shehab/models/categorymodel.dart';
import 'package:news_shehab/modules/HomeCategory/tabOne.dart';
import 'package:news_shehab/shared/network/remote/api.dart';
import '../../models/sources.dart';


class HomeOfCategory extends StatefulWidget {
category categories;
HomeOfCategory(this.categories);

  @override
  State<HomeOfCategory> createState() => _HomeOfCategoryState();
}

class _HomeOfCategoryState extends State<HomeOfCategory> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<sourceResponse>(
      future:apiGenerator.getSources(widget.categories.id??''),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.primary,
            ),
          );
        }
        if (snapshot.hasError) {
          return Text("SomeThing are wrong");
        }
        if(snapshot.data!.status=="error"){
          return Center(
            child: Text(snapshot.data?.message??""),
          );
        }
        var source=snapshot.data?.sources??[];

          return TabOne(source);
        },
    );


  }

  // Articles? articles=null;
  //
  //  selectedfunction(ar){
  //   if(ar==null){
  //     return;
  //   }else{
  //     articles=ar;
  //     setState((){});
  //   }
  // }
}
