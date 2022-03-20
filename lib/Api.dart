import 'package:dio/dio.dart';
import "package:flutter/material.dart";
import 'package:movie_lucifer/model.dart';
import "package:http/http.dart" as http;

class Api {
  // Dio dio = Dio();

  Future<List<User>?> showQuote() async {
    var response =
        await http.get(Uri.parse("https://lucifer-quotes.vercel.app/api/quotes/500"));
    if (response.statusCode == 200) {
      var json = response.body;
      return userFromJson(json);
    } else {
      return null;
    }
  }
}
