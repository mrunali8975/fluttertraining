import 'package:flutter/material.dart';
import 'database.dart';
import 'MenuPage.dart';

class SecondPage extends StatefulWidget {
  SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  String fName = '';

  String lName = '';

  String gender = '';

  GlobalKey<ScaffoldState> scroffKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scroffKey,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
          ),
          MaterialButton(
              child: Container(
                height: 25,
                  width: 100,
                  color: Colors.yellowAccent,
                  padding: EdgeInsets.all(5),
                  child: Text(
                "Show Details",textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              )),
              onPressed: () {
                MyDataBase.selectData().then((value) {
                  setState(() {});
                });
              }),
          Expanded(
            child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(MyDataBase.data['image'] ?? ''),
                ),
                title: Text(MyDataBase.data['fname'] ?? ''),
                subtitle: Text(MyDataBase.data['email'] ?? ''),
                trailing: IconButton(
                  onPressed: () {
                    MyDataBase.deleteData(MyDataBase.data['key']);
                  },
                  icon: Icon(Icons.delete),
                )),
          ),
          SizedBox(
            height: 10,
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RestaurantMenu(),
                    ));
              },
              child: Container(
                  height: 50,
                  width: 200,
                  padding: EdgeInsets.all(10),
                  color: Colors.yellowAccent,
                  child: Text(
                    "MENU",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25),
                  )))
        ],
      ),
    );
  }
}
