import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_core/firebase_core.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:myflutterapp/database.dart';
class addCart extends StatelessWidget {
  addCart({
    Key? key,
    this.proName = '',
    this.prDesc = '',
    this.proimage = '',
  }) : super(key: key);
  String proName = '';
  String prDesc = '';
  String proimage = '';
  String imageUrl='';
  FirebaseStorage storage =FirebaseStorage.instance;

  // getProfilImage() async {
  //   final ImagePicker _picker = ImagePicker();
  //   XFile? image = await _picker.pickImage(source: ImageSource.gallery);
  // }

  uploadImage() async{
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    Reference reference = storage.ref().child("image/${DateTime.now().toString()}");
    UploadTask uploadTask = reference.putFile(File(image!.path));
    await (await uploadTask).ref.getDownloadURL().then((value)
    {
      print(" -==== $value");
      imageUrl=value;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Add Cart",
            textAlign: TextAlign.center, style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
              onPressed: () {
                //MyDataBase.insertData(image, fname, key, lname, contact, email, pass);
              },
              icon: Icon(
                Icons.account_circle,
                color: Colors.black,
              ))
        ],
        backgroundColor: Colors.white,
        actionsIconTheme: IconThemeData(color: Colors.green, size: 40),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 300,
                width: 400,
                color: Colors.blue,
                child: Image(
                  image: NetworkImage(proimage),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Grilled Salmon",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        "by pizza hut",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black87
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 20),
                  Text(
                    "\$98.00",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget sizeheight(double mywidth) => SizedBox(height: mywidth);
}
