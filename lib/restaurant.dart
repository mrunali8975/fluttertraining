import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'addcart.dart';

Widget size(double mywidth) => SizedBox(width: mywidth);

class RestaurantMenu extends StatefulWidget {
  const RestaurantMenu({Key? key}) : super(key: key);

  @override
  State<RestaurantMenu> createState() => _RestaurantMenuState();
}

class _RestaurantMenuState extends State<RestaurantMenu> {
  TabController? tabController;
  String img =
      'https://upload.wikimedia.org/wikipedia/commons/thumb/8/86/Pizza_%281%29.jpg/1200px-Pizza_%281%29.jpg';
  int number = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Stack(
              children: [
                Image.network(
                    'https://img.lovepik.com/photo/40015/5932.jpg_wh300.jpg'),
                Container(
                  margin: EdgeInsets.only(top: 100.0),
                  child: Center(
                    child: Text(
                      'POCKET CAFE',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 50,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Card(
            elevation: 10.0,
            color: Colors.black12,
            margin: EdgeInsets.only(left: 10.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  cardText("PIZZA"),
                  size(10),
                  cardText("BURGER"),
                  size(10),
                  cardText("COFFIE"),
                  size(10),
                  cardText("HOT TEAS"),
                  size(10),
                  cardText("DESSERTS"),
                  size(10),
                  cardText("LEMONADES"),
                  size(10),
                  cardText("LEMONADES")
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return item(
                  name: data[index]['name'],
                  lastChat: data[index]['lastChat'],
                  image: data[index]['image'],
                  fav: data[index]['favorite'] ?? false,
                  onTap: () {
                    setState(() {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return BottomSheetData(
                              img: img,
                              name: data[index]['name'],
                              price: data[index]['lastChat'],
                            );
                          });
                    });
                  },
                  favorite: () {
                    setState(() {
                      data[index]['favorite'] = !data[index]['favorite'];
                    });
                  },
                  moveToNext: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => addCart(
                                proName: data[index]['name'],
                                prDesc: data[index]['lastChat'],
                              )),
                    )
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget cardText(String name) => Text(
        name,
        style: TextStyle(
          color: Colors.redAccent,
          fontSize: 15,
        ),
      );

  Widget productimage(String imgaddress) => Image(
        image: NetworkImage(imgaddress),
      );
  Widget ratingIcon = Icon(
    Icons.star_outline,
    color: Colors.red,
  );

  Widget item({
    String name = '',
    String lastChat = '',
    String image = '',
    bool fav = false,
    Function()? onTap,
    Function()? favorite,
    Function()? moveToNext,
  }) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        radius: 40,
        backgroundImage: NetworkImage(img),
      ),
      trailing: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            child: Icon(
              fav ? Icons.favorite : Icons.favorite_border,
              color: fav ? Colors.red : Colors.grey,
            ),
            onTap: favorite,
          ),
          GestureDetector(
            child: Icon(Icons.add),
            onTap: moveToNext,
          ),
        ],
      ),
      title: Text(
        name,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      subtitle: Text(
        las,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }

  List<Map> data = [
    {
      'name': 'ABC',
      'lastChat': 'Delicious food',
      'price':'\$500',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVGHL9r9OucwArH8yO3rEDPryG4V3tSCBw-w&usqp=CAU',
      'onClick': () => print('ABC'),
      'pickTime': '',
      'favorite': false,
    },
    {
      'name': 'XYZ',
      'lastChat': 'Hiii',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVGHL9r9OucwArH8yO3rEDPryG4V3tSCBw-w&usqp=CAU',
      'onClick': () => print('XYZ'),
      'pickTime': '',
      'favorite': false,
    },
    {
      'name': 'PQR',
      'lastChat': 'How are you?',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVGHL9r9OucwArH8yO3rEDPryG4V3tSCBw-w&usqp=CAU',
      'onClick': () => print('PQR'),
      'pickTime': '',
      'favorite': false,
    },
  ];
}

class BottomSheetData extends StatefulWidget {
  String img = '';
  String name = "";
  String price = "";

  BottomSheetData({this.img = '', this.name = '', this.price = '', Key? key})
      : super(key: key);

  @override
  State<BottomSheetData> createState() => _BottomSheetDataState();
}

class _BottomSheetDataState extends State<BottomSheetData> {
  int number = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(widget.img),
            ),
            title: Text(
              widget.name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(widget.price,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          size(20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Quantity",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              size(20),
              Container(
                height: 35,
                color: Colors.grey,
                child: Row(
                  children: [
                    IconButton(
                      tooltip: "Add",
                      onPressed: () {
                        setState(() {
                          number--;
                        });
                      },
                      icon: Icon(Icons.remove),
                    ),
                    Text('$number',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    IconButton(
                      tooltip: "Add",
                      onPressed: () {
                        setState(() {
                          number++;
                        });
                      },
                      icon: Icon(Icons.add),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Description",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Description fhhh dhhh ",
                  style: TextStyle(fontSize: 15, color: Colors.black87),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Addons ",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Card(
            color: Colors.grey,
            child: Row(
              children: [
                Column(
                  children: [
                    Text("Cheese"),
                    SizedBox(
                      height: 5,
                    ),
                    Text("\$5")
                  ],
                )
              ],
            ),
          )

          // ListView.builder(
          //   itemCount:3,
          //   itemBuilder: (context,index){
          //     return Card(
          //      child: Row(
          //        children: [],
          //      ),
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
