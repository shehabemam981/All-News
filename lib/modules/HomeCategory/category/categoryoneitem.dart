import 'package:flutter/material.dart';
import 'package:news_shehab/models/categorymodel.dart';

class categoryoneitem extends StatelessWidget {
category categories;
int index;
categoryoneitem(this.index,this.categories);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: categories.Colors,
        borderRadius: BorderRadius.only(
          bottomLeft:(index%2!=0)?Radius.circular(0):Radius.circular(15) ,
          bottomRight:(index%2!=0)?Radius.circular(15):Radius.circular(0)  ,
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child:Center(
        child: Column(
          children: [
            Image.asset(categories.image??'',height: 180,),
            Text(categories.name??'',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),),
          ],
        ),
      ) ,
    );
  }
}
