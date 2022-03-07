import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  SecondPage({Key? key, this.fName = '', this.lName = '', this.gender = ''})
      : super(key: key);
  String fName = '';
  String lName = '';
  String gender = '';
  GlobalKey<ScaffoldState> scroffKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scroffKey,
      drawer: Drawer(
        child: Column(
          children: [
            Icon(Icons.settings),
            Text("Settomg")
          ],
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu_open),
          onPressed: () {
            scroffKey.currentState!.openDrawer();
          },
        ),
        actions: [Icon(Icons.settings), Icon(Icons.notifications)],
        title: Text("First Page"),
        centerTitle: true,
        bottom: PreferredSize(
          child: Container(
            height: 50,
            color: Colors.yellow,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.settings),
                Icon(Icons.notifications),
                Icon(Icons.settings),
                Icon(Icons.notifications)
              ],
            ),
          ),
          preferredSize: Size(0, 50),
        ),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 10, left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButton(
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Container(
                height: 300,
                width: 300,
                color: Colors.greenAccent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Firstname  : $fName',
                    ),
                    Text('Last name : $lName'),
                    Text("Gender :$gender"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
