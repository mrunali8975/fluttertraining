import 'dart:math';

import 'package:flutter/material.dart';

class menuApp extends StatelessWidget {
  menuApp({Key? key}) : super(key: key);
  TabController? tabController;
String popfood='https://us.123rf.com/450wm/topntp/topntp1905/topntp190503241/122695896-salmon-teriyaki-steak-with-fried-egg-and-salad-healthy-food-style.jpg?ver=6';
  String pizzaimage =
      'https://uxwing.com/wp-content/themes/uxwing/download/20-food-and-drinks/pizza.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          color: Colors.white30,
          //padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "What would you like to eat?",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  Icon(
                    Icons.notifications_outlined,
                    size: 40,
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: ("What would like to buy?"),
                    prefixIcon: Icon(
                      Icons.search_outlined,
                      color: Colors.red,
                      size: 40,
                    ),
                    suffixIcon: Icon(
                      Icons.mic,
                      color: Colors.red,
                      size: 30,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        end: Alignment.topRight,
                        colors: [Colors.white, Colors.redAccent])),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Card(
                                child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Card(
                                child: Image(
                                  image: NetworkImage(pizzaimage),
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                            )),
                            Text(
                              "Pizza",
                              style: TextStyle(
                                  fontSize: 25, color: Colors.black38),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Card(
                                child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Card(
                                child: Image(
                                  image: NetworkImage(pizzaimage),
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                            )),
                            Text(
                              "Pizza",
                              style: TextStyle(
                                  fontSize: 25, color: Colors.black38),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Card(
                                child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Card(
                                child: Image(
                                  image: NetworkImage(pizzaimage),
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                            )),
                            Text(
                              "Pizza",
                              style: TextStyle(
                                  fontSize: 25, color: Colors.black38),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Card(
                                child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Card(
                                child: Image(
                                  image: NetworkImage(pizzaimage),
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                            )),
                            Text(
                              "Pizza",
                              style: TextStyle(
                                  fontSize: 25, color: Colors.black38),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Card(
                                child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Card(
                                child: Image(
                                  image: NetworkImage(pizzaimage),
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                            )),
                            Text(
                              "Pizza",
                              style: TextStyle(
                                  fontSize: 25, color: Colors.black38),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Popular Foods",
                    style: TextStyle(
                        fontSize: 28,
                        color: Colors.black,
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                        fontSize: 28,
                        color: Colors.blue,
                        fontWeight: FontWeight.normal),
                  )
                ],
              ),
              SingleChildScrollView(
                child: Row(
                  children: [
                    Container(
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                              height:100,
                    width:100,child: Image(image: NetworkImage(popfood),height: 100,width: 100,))
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
