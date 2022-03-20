// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
    User({
        required this.quote,
        required this.author,
    });

    String quote;
    String author;

    factory User.fromJson(Map<String, dynamic> json) => User(
        quote: json["quote"],
        author: json["author"],
    );

    Map<String, dynamic> toJson() => {
        "quote": quote,
        "author": author,
    };
}
