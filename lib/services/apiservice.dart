import 'dart:convert';
import 'package:http/http.dart';
import 'package:expense_api/model/article.dart';

class ApiService
{
  final endpoint="https://newsapi.org/v2/everything?domains=wsj.com&apiKey=5e98152fd104453196db6a5652d92b0d";
  Future<List<Article>> getArticle() async{
    Response response = await get(Uri.parse(endpoint));

    if(response.statusCode ==200)
    {
      Map<String,dynamic> json = jsonDecode(response.body);
      List<dynamic> body = json["articles"];
      List<Article> article = body.map((dynamic item) => Article.fromJson(item)).toList();
      return article;
    }
    else
    {
      throw "Data not found";
    }
  }

}