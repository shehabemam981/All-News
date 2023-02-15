import 'package:flutter/material.dart';
import 'package:news_shehab/models/Everything.dart';
import 'package:cached_network_image/cached_network_image.dart';
class ImageItem extends StatelessWidget {
  Articles? article;
  ImageItem(this.article);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius:  BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              fit: BoxFit.fill,
            imageUrl: (article?.urlToImage??''),
            placeholder: (context, url) => Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),),
            Text(article?.author??'',style: TextStyle(color: Colors.grey),),
            Text(article?.title??'',style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),
            Text(article?.publishedAt?.substring(0,9)??'',style: TextStyle(
              color: Colors.grey,
            ),textAlign: TextAlign.end,
            ),
          ],
        ),

    );
  }
}
