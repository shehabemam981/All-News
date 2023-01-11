import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'package:news_shehab/shared/constant.dart';
import '../../../models/Everything.dart';
import '../../../models/sources.dart';

class apiGenerator {
  //https://newsapi.org/v2/everything?sources=abc-news-au&apiKey=d369fc7cd4e34bb9a4d2c2b6e8a0766e
  static Future<EveryThing> getEveryThing(String id) async {
    Uri URL = Uri.https(baseurl,
         "/v2/everything",
         {"sources": id, "apikey": apikey});
    Response everything = await http.get(URL);
    var json = jsonDecode(everything.body);
    EveryThing articleeverything = EveryThing.fromJson(json);
    return articleeverything;
  }
  //https://newsapi.org/v2/top-headlines/sources?apiKey=d369fc7cd4e34bb9a4d2c2b6e8a0766e
  static Future<sourceResponse> getSources()async{
    Uri URL=Uri.https(baseurl,'/v2/top-headlines/sources',{
      "apiKey":apikey,
    } );
    Response sources=await http.get(URL);
  var json= jsonDecode(sources.body);
  sourceResponse sourcemodel=  sourceResponse.fromJson(json);
  return sourcemodel;

  }
}
