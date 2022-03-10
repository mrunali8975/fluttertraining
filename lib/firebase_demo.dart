import 'database.dart';
import 'package:flutter/material.dart';

class FireBaseDemo extends StatefulWidget {
  FireBaseDemo({Key? key}) : super(key: key);

  @override
  State<FireBaseDemo> createState() => _FireBaseDemoState();
}

class _FireBaseDemoState extends State<FireBaseDemo> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passController = TextEditingController();

  String selectedDataKey = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TextField(controller: emailController),
            TextField(controller: passController),


            MaterialButton(
                onPressed: () {
                  MyDataBase.insertData(
                    emailController.text,
                    passController.text,
                  ).then((value) {
                    setState(() {});
                  });
                },
                child: Text('Insert')),
            MaterialButton(
                onPressed: () {
                  MyDataBase.updateDate(
                    emailController.text,
                    passController.text,
                    selectedDataKey,
                  ).then((value) {
                    setState(() {});
                  });
                },
                child: Text('Update')),
            MaterialButton(onPressed: () {}, child: Text('Delete')),
            MaterialButton(
                onPressed: () {
                  MyDataBase.selectData().then((value) {
                    setState(() {});
                  });
                },
                child: Text('Select')),
            Expanded(
              child: ListView.builder(
                itemCount: MyDataBase.data.length,
                itemBuilder: (context, index) => ListTile(
                  onTap: () {
                    setState(() {
                      emailController.text = MyDataBase.data[index]['email'];
                      passController.text = MyDataBase.data[index]['pass'];
                      selectedDataKey = MyDataBase.data[index]['key'];
                    });
                  },
                  title: Text(MyDataBase.data[index]['email']),
                  subtitle: Text(MyDataBase.data[index]['pass']),
                  trailing: IconButton(
                    onPressed: () {
                      MyDataBase.deleteData(MyDataBase.data[index]['key']);
                    },
                    icon: Icon(Icons.delete),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
