import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:task_twitter_clone/model/post.dart';

class Api {
  static const uri = "https://techcrunch.com/wp-json/wp/v2/posts";
  static Future<List<PostModel>> getPosts(int perPage, int pageNumber) async {
    try {
      http.Response res = await http.get(Uri.parse(
        "$uri?per_page=$perPage&page=$pageNumber",
      ));
      List data = jsonDecode(res.body);
      return data.map((e) => PostModel.fromJson(e)).toList();
    } on Exception catch (e) {
      log(e.toString());
    }
    return [];
  }
}
