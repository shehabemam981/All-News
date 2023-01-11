import 'package:flutter/material.dart';
import 'package:news_shehab/modules/HomeCategory/tabOne.dart';
import 'package:news_shehab/shared/network/remote/api.dart';
import '../../models/sources.dart';


class HomeOfCategory extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<sourceResponse>(
      future:apiGenerator.getSources(),
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
}
