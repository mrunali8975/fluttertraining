import 'package:firebase_database/firebase_database.dart';

class MyDataBase {
  static List<Map> data = [];
  static DatabaseReference db = FirebaseDatabase.instance.ref('students');

  static Future insertData(String image,String fname,String key, String lname,String contact,String email,String pass) async {
    String key = db.push().key!;

    db.child(key).set({
      'email': email,
      'pass': pass,
      'fname': fname,
      'lname': lname,
      'contact': contact,
      'image':image,
      'key': key,
    });
  }

  static Future updateDate(String email, String pass, String key) async {
    db.child(key).update({
      'email': email,
      'pass': pass,
      'key': key,
    }).then((value) {
      selectData();
    });
  }

  static deleteData(String key) {
    db.child(key).remove();
  }

  static Future selectData() async {

    Map temp = {};
    db.once().then((value) {
      temp = value.snapshot.value as Map;
      data.clear();
      temp.forEach((key, value) {
        data.add(value);
      });
    });
  }
}
