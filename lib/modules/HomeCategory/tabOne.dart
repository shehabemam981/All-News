import 'package:flutter/material.dart';
import 'package:news_shehab/models/Everything.dart';
import 'package:news_shehab/modules/HomeCategory/tabbarscreen.dart';
import 'package:news_shehab/shared/network/remote/api.dart';

import '../../models/sources.dart';
import 'imageItem.dart';



class TabOne extends StatefulWidget {
  List<Sources> sources;

  TabOne(this.sources);

  @override
  State<TabOne> createState() => _TabOneState();
}

class _TabOneState extends State<TabOne> {
  int Selecteditem=0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
            length: widget.sources.length,
            child: TabBar(
              onTap: (index){
                Selecteditem=index;
                setState((){});
              },
            indicatorColor: Colors.white,
              isScrollable: true,
                labelColor: Colors.black,
                tabs: widget.sources
                    .map((source) =>
                    TabBarScreen( Selecteditem==widget.sources.indexOf(source)?true:false,
                        source))
                    .toList(),
        ),
        ),
        FutureBuilder<EveryThing>(
          future: apiGenerator.getEveryThing(
              widget.sources[Selecteditem].id??""
          ),
            builder: (context,snapshot){
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                );
              }
              if (snapshot.hasError) {
                print (snapshot.error);
                return Text("SomeThing are wrong");
              }
              if(snapshot.data?.status=="error"){
                return Center(
                  child: Text(snapshot.data?.messege??""),
                );
              }
              var article=snapshot.data?.articles??[];
              return Expanded(
                child: ListView.builder(
                  itemCount: article.length,
                  itemBuilder: (context, index) {
                    return ImageItem(article[index]);
                  }
                ),
              );
            },
        ),

      ],
    );
  }
}
