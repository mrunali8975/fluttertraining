import 'package:flutter/material.dart';

class thirdday extends StatelessWidget {
  const thirdday({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 500,
          height: 500,
          color: Colors.yellow,
          child: SingleChildScrollView(
            child: Row(
              children: [
                Container(height:200,width: 200,

                 decoration: BoxDecoration(
                     color: Colors.red,
                   border: Border.all(width:2,color: Colors.blue),
                       borderRadius: BorderRadius.circular(20),

                   gradient:LinearGradient(begin: Alignment.topLeft,end: Alignment.bottomCenter,colors: [Colors.blue,Colors.red])

                 ),


                ),
                SizedBox(width: 10,),
                Container(height:400,width: 300,
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    border: Border.all(width: 5,color: Colors.green),
                      borderRadius: BorderRadiusDirectional.only(topStart: Radius.elliptical(2, 3))
                  ),

                ),
                Container(height: 30,width:20,color: Colors.green,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
