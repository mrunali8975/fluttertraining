import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
   SecondPage({Key? key,this.fName='',this.lName='',this.gender=''}) : super(key: key);
String fName='';
String lName='';
String gender='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            children: [
              BackButton(
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
              Text( 'Firstname  : $fName'),
              Text('Last name : $lName'),
              Text("Gender :$gender"),
            ],
          ),
        )
        ,
      ),
    );
  }
}
