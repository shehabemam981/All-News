import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:news_shehab/models/Everything.dart';
import 'package:url_launcher/url_launcher.dart';

class detailsScreen extends StatelessWidget {
  static const String routeName="details";

  @override
  Widget build(BuildContext context) {
    var args=ModalRoute.of(context)?.settings.arguments as Articles;
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("assets/images/pattern.png"),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(args.author??''),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: (args.urlToImage ?? ''),
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              Text(
                args.author ?? '',
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              ),
              Text(
                args.title ?? '',
                style:
                    TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              ),
              Text(
                args.publishedAt?.substring(0, 9) ?? '',
                style: TextStyle(
                  color: Colors.grey,
                ),
                textAlign: TextAlign.end,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: Text(
                  args.description ?? '',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              InkWell(
                onTap: (){
                  _launchUrl( Uri.parse(args.url??'please enter url'));
                },
                child: Container(
                  color: Colors.white,
                  margin: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("view all article"),
                      SizedBox(width: 10,),
                      Icon(Icons.arrow_forward_ios_sharp),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Future<void> _launchUrl(url) async {
    if (!await launchUrl(url)) {
      print("object");
      throw Exception('Could not launch $url');
    }}
}
