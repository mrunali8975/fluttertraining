import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:myflutterapp/database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:image_picker/image_picker.dart';

import 'UserDetails.dart';

class workDay4 extends StatefulWidget {
  const workDay4({Key? key}) : super(key: key);

  @override
  State<workDay4> createState() => _workDay4State();
}

class _workDay4State extends State<workDay4> {
  bool pass = false;
  String selectedDataKey = '';
  bool checkbox = false;
  bool checkbox2 = false;
  bool checkbox3 = false;
  String selectDate = "";
  String error = '';
  String male = 'Male';
  String female = 'Female';
  String other = 'Other';
  String gender = 'Male';
  GlobalKey<FormState> key = GlobalKey<FormState>();
  TextEditingController emailText = TextEditingController();
  TextEditingController FnameText = TextEditingController();
  TextEditingController lnameText = TextEditingController();
  TextEditingController phoneNumberText = TextEditingController();
  TextEditingController passText = TextEditingController();
  String imageUrl = '';
  FirebaseStorage storage = FirebaseStorage.instance;

  uploadImage() async {
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    Reference reference =
        storage.ref().child("image/${DateTime.now().toString()}");
    UploadTask uploadTask = reference.putFile(File(image!.path));

    await (await uploadTask).ref.getDownloadURL().then((value) {
      print(" -==== $value");
      imageUrl = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.image),
          onPressed: () {
            uploadImage();
          },
        ),
      ),
      body: Center(
          child: Form(
        key: key,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20.0),
                height: 100,
                width: 100,
                child: Image.network(
                    'https://www.nicepng.com/png/full/138-1388174_login-account-icon.png'),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Registration Form",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: 50,
                      margin: EdgeInsets.only(left: 20.0),
                      child: TextFormField(
                        autofocus: false,
                        controller: FnameText,
                        validator: (val) {
                          return val!.isEmpty
                              ? 'Please Enter valid email '
                              : '';
                        },
                        decoration: InputDecoration(
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:
                                BorderSide(color: Colors.purple, width: 2),
                          ),
                          hintText: "Enter your name",
                          filled: true,
                          fillColor: Colors.black26,
                          prefixIcon: Icon(Icons.account_box),
                          label: Text(
                            'First Name',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                        width: 50,
                        margin: EdgeInsets.only(left: 20.0, right: 20.0),
                        child: TextFormField(
                          autofocus: false,
                          controller: lnameText,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.black26,
                              prefixIcon: Icon(Icons.account_box),
                              hintText: "Enter your Last name",
                              label: Text(
                                'Last Name',
                                style: TextStyle(color: Colors.black),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                        ),
                      ))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0, right: 20.0),
                child: TextFormField(
                  controller: phoneNumberText,
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      hintText: "Enter your contact number",
                      label: Text(
                        'Contact No',
                        style: TextStyle(color: Colors.black),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0, right: 20.0),
                child: TextFormField(
                  controller: emailText,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: "Enter your  Email",
                      label: Text(
                        'Email Address',
                        style: TextStyle(color: Colors.black),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      prefixIcon: Icon(Icons.email)),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0, right: 20.0),
                child: TextFormField(
                  controller: passText,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    hintText: "Enter your password",
                    label: Text(
                      'Password ',
                      style: TextStyle(color: Colors.black),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    // suffixIcon: Icon(
                    //
                    //   Icons.visibility,
                    //   size: 20,
                    // ),
                    suffixIcon: IconButton(
                      icon:
                          Icon(pass ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          pass = !pass;
                        });
                      },
                    ),
                  ),
                  obscureText: pass,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                margin: EdgeInsets.only(left: 15.0, right: 10.0),
                // padding: EdgeInsets.all(10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Gender",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Radio(
                          // controller:genderDisplayText,
                          value: male,
                          groupValue: gender,
                          onChanged: (val) {
                            setState(() {
                              gender = val.toString();
                            });
                          }),
                      SizedBox(
                        width: 2.0,
                      ),
                      Text(
                        "Male",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Radio(
                          value: female,
                          groupValue: gender,
                          onChanged: (val) {
                            setState(() {
                              gender = val.toString();
                            });
                          }),
                      SizedBox(
                        width: 2.0,
                      ),
                      Text(
                        "Female",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Radio(
                          value: other,
                          groupValue: gender,
                          onChanged: (val) {
                            setState(() {
                              gender = val.toString();
                            });
                          }),
                      SizedBox(
                        width: 2.0,
                      ),
                      Text(
                        "Other",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
              // Container(
              //   margin: EdgeInsets.only(left: 20.0),
              //   child: Column(
              //     mainAxisSize: MainAxisSize.min,
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text(
              //         "Hobbies",
              //         textAlign: TextAlign.left,
              //         style:
              //             TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              //       ),
              //       Row(
              //         children: [
              //           Checkbox(
              //               value: checkbox,
              //               onChanged: (val) {
              //                 setState(() {
              //                   checkbox = val.toString() as bool;
              //                 });
              //               }),
              //           Text("Playing Cricket"),
              //         ],
              //       ),
              //       Row(
              //         children: [
              //           Checkbox(
              //               value: checkbox2,
              //               onChanged: (val) {
              //                 setState(() {
              //                   checkbox2 = val!;
              //                 });
              //               }),
              //           Text("Cooking")
              //         ],
              //       ),
              //       Row(
              //         children: [
              //           Checkbox(
              //               value: checkbox3,
              //               onChanged: (val) {
              //                 setState(() {
              //                   checkbox3 = val!;
              //                 });
              //               }),
              //           Text("Reading")
              //         ],
              //       ),
              //       Text(
              //         "D.O.B",
              //         style:
              //             TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              //       ),
              //       MaterialButton(
              //           color: Colors.amberAccent,
              //           child: Text(
              //             "select date",
              //           ),
              //           onPressed: () async {
              //             DateTime? date = await showDatePicker(
              //                 context: context,
              //                 initialDate: DateTime.now(),
              //                 firstDate: DateTime(1900),
              //                 lastDate: DateTime(3000));
              //
              //             selectDate = date!.day.toString() +
              //                 '/' +
              //                 date.month.toString() +
              //                 '/' +
              //                 date.year.toString();
              //           })
              //     ],
              //   ),
              // ),
              MaterialButton(
                  color: Colors.blue,
                  elevation: 30.0,
                  child: Text('SUBMIT'),
                  onPressed: () {
                    MyDataBase.insertData(
                        imageUrl,
                        FnameText.text,
                        selectDate,
                        lnameText.text,
                        phoneNumberText.text,
                        emailText.text,
                        passText.text);
                    MyDataBase.selectData();
                    //key.currentState!.validate();
                    setState(
                      () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SecondPage(),
                            ));
                      },
                    );
                  }),
              SizedBox(
                height: 10,
              ),
              // Container(
              //   child: Padding(
              //     padding: const EdgeInsets.only(top: 15, bottom: 10),
              //     child: Container(
              //       color: Colors.black26,
              //       child: Padding(
              //         padding: EdgeInsets.all(10),
              //         child: Column(
              //           children: [
              //             Row(
              //               children: [
              //                 Text("First name : ",
              //                     style: TextStyle(
              //                         fontSize: 20,
              //                         fontWeight: FontWeight.bold)
              //                 ),
              //                 // Text(
              //                 //   fName,
              //                 //   style: TextStyle(
              //                 //       fontSize: 20,
              //                 //       fontWeight: FontWeight.w400),
              //                 // ),
              //               ],
              //             ),
              //             // Row(
              //             //   children: [
              //             //     Text("Last name : ",
              //             //         style: TextStyle(
              //             //             fontSize: 20,
              //             //             fontWeight: FontWeight.bold)
              //             //     ),
              //             //     Text(
              //             //       style: TextStyle(
              //             //           fontSize: 20,
              //             //           fontWeight: FontWeight.w400),
              //             //     ),
              //             //   ],
              //             // )
              //           ],
              //         ),
              //       ),
              //
              //       // crossAxisAlignment: CrossAxisAlignment.end,
              //       //     children: [
              //       //      Text(fName,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              //       //       Text(lName,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              //       //       Text(email,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
              //       //
              //       //    ,Text(phoneNumber,style:
              //       //
              //       //     TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
              //       // ],
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      )),
    );
  }
}
