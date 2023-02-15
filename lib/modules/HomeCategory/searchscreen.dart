import 'package:flutter/material.dart';
import 'package:news_shehab/models/Everything.dart';
import 'package:news_shehab/models/categorymodel.dart';

import 'package:news_shehab/shared/network/remote/api.dart';

import '../../layout/homeScreen.dart';
import 'imageItem.dart';

class searchscreen extends StatefulWidget {
static const String routename="search";

  @override
  State<searchscreen> createState() => _searchscreenState();
}

class _searchscreenState extends State<searchscreen> {
String queryvalue="";
List<Articles> lists=[];
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
         fit: BoxFit.cover,
         image: AssetImage("assets/images/pattern.png")),
    ),
    child: Scaffold(
    backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 80,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight:Radius.circular(30) ,
              bottomLeft: Radius.circular(30),
            ),
          ),
        title: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),

          ),
          child: TextFormField(
            onChanged: (value){

              print("$queryvalue");
              setState((){ queryvalue=value;});
            },
            decoration: InputDecoration(
              hintText: "search",
              contentPadding: EdgeInsets.only(top: 13),
              suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.search)),
              prefixIcon: IconButton(onPressed: (){
                Navigator.pushReplacementNamed(context, HomeScreen.RouteName);
              }, icon: Icon(Icons.close)),
            ),
          ),
        ),
      ),
      body: ListView.builder(itemBuilder: (context,index)=>
          ImageItem(search().elementAt(index)),
        itemCount:search().length,),
    ));
  }

  List search(){
    apiGenerator.getEveryThing(query:queryvalue).then((value) =>
    lists=value.articles??[],
    ).catchError((onError)=> "$onError");
    return lists;
  }
}
