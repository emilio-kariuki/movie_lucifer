import "package:flutter/material.dart";
import 'package:movie_lucifer/Api.dart';
import 'package:movie_lucifer/model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<User>? users;
  bool isLoaded = false;

  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getQuote();
  }
  getQuote() async {
    users = await Api().showQuote();
    if (users != null) {
      setState(() {
        isLoaded = true;
      });
    } 
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Lucifer Quotes"),
        ),
        body: Visibility(
          visible: isLoaded,
          child: ListView.builder(
              itemCount: users?.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5, top: 10),
                  child: Container(
                    height: size.height * 0.21,
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(users![index].quote),
                        Text(users![index].author),
                      ],
                    ),
                  ),
                );
              }),
              replacement: const CircularProgressIndicator(),
        ));
  }
}
