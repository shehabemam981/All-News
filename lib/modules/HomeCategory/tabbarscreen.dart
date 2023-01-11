import 'package:flutter/material.dart';
import 'package:news_shehab/models/sources.dart';

class TabBarScreen extends StatelessWidget {

  Sources? source;
  bool? isSelected;
  TabBarScreen(this.isSelected,this.source);
  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding:  EdgeInsets.all(15.0),
      decoration: BoxDecoration(
      color: (isSelected==true)?Theme.of(context).colorScheme.primary:Colors.white,
      border: Border.all(color: Theme.of(context).colorScheme.primary),
      borderRadius: BorderRadius.circular(30),
      ),
      child:Text(source?.name??'',style:(isSelected==true)? Theme.of(context).textTheme.headline1?.copyWith(color: Colors.white): Theme.of(context).textTheme.headline1?.copyWith(color: Colors.black)),
      ),
    );
  }
}
