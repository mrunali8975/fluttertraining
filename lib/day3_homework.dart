import 'package:flutter/material.dart';

class Day3 extends StatelessWidget {
  const Day3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child:
        Container(
          margin: EdgeInsets.only(top: 10.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  elevation: 10,
                  color: Colors.white,
                  // margin: EdgeInsets.only(left: 10.0, top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$3993.00",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        (Icons.menu),
                        size: 41,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      // margin: EdgeInsets.only(left: 20.0),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20.0),
                            bottomLeft: Radius.circular(20.0)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search,
                            size: 40,
                            color: Colors.white,
                          ),
                          Text(
                            "LOAD MONEY",
                            style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0)),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.green,
                              Colors.white,
                            ],
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.print,size: 40,color: Colors.white,),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "REQUEST MONEY",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize:20, color: Colors.white,fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 150,

                      width: 150,
                      // margin: EdgeInsets.only(left: 20.0),
                      decoration: BoxDecoration(
                        // color: Colors.blue,

                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0)),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.lightBlueAccent,
                              Colors.white,
                            ],
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.print,
                            size: 40,color: Colors.white,
                          ),
                          Text(
                            "PRINT",
                            style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20.0),
                              bottomLeft: Radius.circular(20.0)),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.deepPurple,
                              Colors.white,
                            ],
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.image,size: 40,color: Colors.white,),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "MERCHANT MONEY",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.only(left: 20.0,right: 20.0),
                  decoration: BoxDecoration(
                    color: Colors.red,

                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 40,
                      ),

                      Container(
                        // padding: EdgeInsets.only(top: 35.0),
                        height: 150,
                        width: 200,
                        child: Column(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Shell Darwen",
                              style:
                              TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              "Merchant Payment",
                              style:
                              TextStyle(fontSize: 15, color: Colors.white,fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),

                      Container(
                        // padding: EdgeInsets.only(
                        //   top: 35.0,
                        // ),
                        child: Column(
                          children: [
                            Text(
                              "\$30",
                              style:
                              TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              "30.12.2020",
                              style:
                              TextStyle(fontSize: 15, color: Colors.white,fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
