import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsman/constants/constant.dart';
import 'package:newsman/controllerandModel/newsModal.dart';

class API {
  final IndianNews =
      "https://newsapi.org/v2/top-headlines?country=in&apiKey=${apiKey}";
  // final GlobalNews =
  //     'https://newsapi.org/v2/top-headlines/sources?apiKey=${apiKey}';

  Future<List<NewsModal>> getLatestIndianNews() async {
    final response = await http.get(Uri.parse(IndianNews));
    String Status = json.decode(response.body)['status'];

    if (Status == 'ok') {
      final List<dynamic> data = json.decode(response.body)['articles'];
      List<NewsModal> newsList =
          data.map((news) => NewsModal.fromMap(news)).toList();
      print(Status);
      print(newsList[0].title);
      return newsList;
    } else {
      throw Exception('Failed To Load Latest News');
    }
  }

  // Future<List<NewsModal>> getLatestGlobalNews() async {
  //   final response = await http.get(Uri.parse(GlobalNews));
  //   String Status = json.decode(response.body)['status'];

  //   if (Status == 'ok') {
  //     final List<dynamic> data = json.decode(response.body)['articles'];
  //     List<NewsModal> newsList =
  //         data.map((news) => NewsModal.fromMap(news)).toList();
  //     print(Status);
  //     print(newsList[0].title);
  //     return newsList;
  //   } else {
  //     throw Exception('Failed To Load Latest News');
  //   }
  // }

  Future<List<NewsModal>> getCategoryNews(Category) async {
    final CategoryNews =
        'https://newsapi.org/v2/top-headlines?category=${Category}&language=en&apiKey=${apiKey}';
    final response = await http.get(Uri.parse(CategoryNews));
    String Status = json.decode(response.body)['status'];

    if (Status == 'ok') {
      final List<dynamic> data = json.decode(response.body)['articles'];
      List<NewsModal> newsList =
          data.map((news) => NewsModal.fromMap(news)).toList();
      print(Status);
      print(newsList[0].title);
      return newsList;
    } else {
      throw Exception('Failed To Load Latest News');
    }
  }

  Future<List<NewsModal>> getSearchNews(SearchText) async {
    final SearchNews =
        'https://newsapi.org/v2/everything?q=${SearchText}&sortBy=publishedAt&apiKey=${apiKey}';
    final response = await http.get(Uri.parse(SearchNews));
    String Status = json.decode(response.body)['status'];

    if (Status == 'ok') {
      final List<dynamic> data = json.decode(response.body)['articles'];
      List<NewsModal> newsList =
          data.map((news) => NewsModal.fromMap(news)).toList();
      print(Status);
      print(newsList[0].title);
      return newsList;
    } else {
      throw Exception('Failed To Load Latest News');
    }
  }
}
