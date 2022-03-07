import 'package:flutter/material.dart';

class addCart extends StatelessWidget {
   addCart({Key? key,this.proName='',this.prDesc=''
  }) : super(key: key);
String proName='';
String prDesc='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child:Text("$proName"),),);
  }
}
