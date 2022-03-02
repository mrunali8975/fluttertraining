import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: FirstPage(),
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
