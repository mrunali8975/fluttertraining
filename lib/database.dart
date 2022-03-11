import 'package:firebase_database/firebase_database.dart';

class MyDataBase {
  static Map data = {};
  static String dataKey = '';
  static DatabaseReference db = FirebaseDatabase.instance.ref('students');

  static Future insertData(String image, String fname, dataKey, String lname,
      String contact, String email, String pass) async {
    dataKey = db.push().key!;

    db.child(dataKey).set({
      'email': email,
      'pass': pass,
      'fname': fname,
      'lname': lname,
      'contact': contact,
      'image': image,
      'key': dataKey,
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
    db.child(dataKey).once().then((value) {
      temp = value.snapshot.value as Map;
      data.clear();
       print('//====$temp');

      data = temp;
      // temp.forEach((key, value) {
      //   data.add(value);
      // });
    });
  }
}
