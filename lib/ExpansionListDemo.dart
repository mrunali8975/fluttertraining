import 'package:flutter/material.dart';

class packges_demo extends StatelessWidget {
  const packges_demo({Key? key}) : super(key: key);
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(_title),),
      body: const MyStatefulWidget(),
    );
  }
}

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false;
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;

}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Image_Picker $index',
      expandedValue: 'This is item number $index',
    );
  });
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final List<Item> _data = generateItems(8);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return Column(
              children: [
                ListTile(
                  title: Text(item.headerValue),
                ),
              ],
            );
          },
          body: Column(
              children: [
              // ListTile(
              //     title: Text(item.expandedValue),
              //     subtitle:
              //     const Text('To delete this panel, tap the trash can icon'),
              //     trailing: const Icon(Icons.delete),
              //     onTap: () {
              //       setState(() {
              //         _data.removeWhere((Item currentItem) => item == currentItem);
              //       });
              //     }),
              Text("Hello User"),
          SizedBox(height: 20,),
          Stack(children: [
          ],

          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}


