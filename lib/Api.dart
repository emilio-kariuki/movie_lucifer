import 'package:dio/dio.dart';
import "package:flutter/material.dart";
import 'package:movie_lucifer/model.dart';

class Api {
  Dio dio = Dio();

  Future<List<User>?> showQuote() async {
    var response =
        await dio.get("https://lucifer-quotes.vercel.app/api/quotes/500");
    if(response.statusCode == 200){
      var json = response.data;
    return userFromJson(json);
    }
  }
}
