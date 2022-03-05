import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myflutterapp/thirdayflutter.dart';
import 'day3_homework.dart';
import 'day4.dart';
main() {
  runApp(MaterialApp(
    home: workDay4(),
    //debugShowCheckedModeBanner: false,
    //theme: ThemeData(brightness: Brightness.dark,
    // primaryColor: Colors.green,
    //),
  ));
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          height: 40,
          color: Colors.amber,
        ),
        appBar: AppBar(
          leading: Icon(Icons.menu),
          title: Text("TITLE"),
        ),
        backgroundColor: Colors.green,

        body: Center(
          child: Text("Hello World"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.black,
          child: const Icon(
            Icons.wifi,
            color: Colors.red,
          ),
        ),

      ),
    );
  }
}
