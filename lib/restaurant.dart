import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:circle_bottom_navigation_bar/circle_bottom_navigation_bar.dart';
import "package:circle_bottom_navigation_bar/widgets/tab_data.dart";
import 'package:circle_bottom_navigation_bar/circle_bottom_navigation_bar.dart';
import 'addcart.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';


Widget size(double mywidth) => SizedBox(width: mywidth);

class RestaurantMenu extends StatefulWidget {
  const RestaurantMenu({Key? key}) : super(key: key);

  @override
  State<RestaurantMenu> createState() => _RestaurantMenuState();
}
class _MyAppState extends State<MyApp> {
  double value = 3.5;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Example'),
        ),
        body: Center(
          child: RatingStars(
            value: value,
            onValueChanged: (v) {
              //
              setState(() {
                value = v;
              });
            },
            starBuilder: (index, color) => Icon(
              Icons.ac_unit_outlined,
              color: color,
            ),
            starCount: 5,
            starSize: 20,
            valueLabelColor: const Color(0xff9b9b9b),
            valueLabelTextStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 12.0),
            valueLabelRadius: 10,
            maxValue: 5,
            starSpacing: 2,
            maxValueVisibility: true,
            valueLabelVisibility: true,
            animationDuration: Duration(milliseconds: 1000),
            valueLabelPadding:
            const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
            valueLabelMargin: const EdgeInsets.only(right: 8),
            starOffColor: const Color(0xffe7e8ea),
            starColor: Colors.yellow,
          ),
        ),
      ),
    );
  }
}
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const Center(
          child: Text(
            'Home',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const Center(
          child: Text(
            'History',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const Center(
          child: Text(
            'Search',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class Alarm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const Center(
          child: Text(
            'Alarm ',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
class _RestaurantMenuState extends State<RestaurantMenu>
    with TickerProviderStateMixin {
  int currentPage = 0;
  final List<Widget> _pages = [
    Home(),
    History(),
    Search(),
    Alarm(),
  ];
  List pizza = [
    {
      'name': 'Exotic',
      'price': '\$139',
      'desc': 'Chees,olives,jalapenos,tomatoes & onions',
      'image':
          'https://images.all-free-download.com/images/graphiclarge/homemade_burger_560254.jpg',
    },
    {
      'name': 'Chilli Cheese Chicken',
      'price': '\$159',
      'desc': 'Chicken pepperoni on top of foey chilli cheese',
      'image':
          'https://images.all-free-download.com/images/graphiclarge/homemade_burger_560254.jpg',
    },
    {
      'name': 'Potato Wedged',
      'price': '\$165',
      'desc': ' Served with cheese  & jalapeno dip',
      'image':
          'https://images.all-free-download.com/images/graphiclarge/homemade_burger_560254.jpg',
    },
  ];
  List burger = [
    {
      'name': 'Cheese Meltdown',
      'price': '\$139',
      'desc':
          'A BK Original Burger With Cheese oozing Spicy Veg Patty. A Must Try!',
      'image':'https://image.shutterstock.com/image-photo/vegetarian-burger-260nw-664768828.jpg'
    },
    {
      'image':
         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8JlJ6IK0bKjqvpcQY-LJWpNBmdf3YWl_Tp7I9ZaEOy485DJbgpdWdJ4OhEacuxmOz_Pk&usqp=CAU',
      'name': 'Crispy Veg Double Patty + Crispy Veg Double Patty',
      'price': '\$139',
      'desc': 'Crispy Veg Double Patty + Crispy Veg Double Patty'
    },
    {
      'image':
          'https://images.all-free-download.com/images/graphiclarge/homemade_burger_560254.jpg',
      'name': 'Lite Whopper Jr Veg + Lite Whopper Jr Veg',
      'price': '\$139',
      'desc': 'Lite Whopper Jr Veg + Lite Whopper Jr Veg'
    },
  ];

  TabController? tabController;
  String img =
      'https://upload.wikimedia.org/wikipedia/commons/thumb/8/86/Pizza_%281%29.jpg/1200px-Pizza_%281%29.jpg';
  int number = 1;

  @override
  void initState() {
    tabController = TabController(length: 7, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CircleBottomNavigationBar(
        initialSelection: currentPage,
        circleColor: Colors.purple,
        activeIconColor: Colors.white,
        inactiveIconColor: Colors.grey,
        tabs: [
          TabData(
            icon: Icons.home,
            iconSize: 25,// Optional
            title: 'Home',// Optional
            fontSize: 12,// Optional
          ),
          TabData(icon: Icons.history),
          TabData(icon: Icons.search),
          TabData(icon: Icons.alarm),
        ],
        onTabChangedListener: (index) => setState(() => currentPage = index),
      ),
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
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 50,
                  child: TabBar(
                    isScrollable: true,
                    controller: tabController,
                    tabs: [
                      cardText("PIZZA"),
                      cardText("BURGER"),
                      cardText("COFFIE"),
                      cardText("HOT TEAS"),
                      cardText("DESSERTS"),
                      cardText("LEMONADES"),
                      cardText("LEMONADES")
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      // Container(),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: pizza.length,
                        itemBuilder: (context, index) {
                          return item(
                            name: pizza[index]['name'],
                            Desc: pizza[index]['desc'],
                            image: data[index]['image'],
                            price: data[index]['price'],
                            fav: data[index]['favorite'] ?? false,
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return BottomSheetData(
                                      img: data[index]['image'],
                                      name: pizza[index]['name'],
                                      desc: pizza[index]['desc'],
                                      price: pizza[index]['price'],
                                    );
                                  });
                            },
                          );
                        },
                      ),

                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: pizza.length,
                        itemBuilder: (context, index) {
                          return item(
                            name: burger[index]['name'],
                            Desc: burger[index]['desc'],
                            image: data[index]['image'],
                            price: burger[index]['price'],
                            fav: data[index]['favorite'] ?? false,
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return BottomSheetData(
                                      img: burger[index]['image'],
                                      name: burger[index]['name'],
                                      desc: burger[index]['desc'],
                                      price: burger[index]['price'],
                                    );
                                  });
                            },
                          );
                        },
                      ),

                      Container(),

                      Container(),

                      Container(),

                      Container(),

                      Container(),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
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
    String Desc = '',
    String image = '',
    String price = '',
    bool fav = false,
    Function()? onTap,
    Function()? favorite,
    Function()? moveToNext,
  }) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        radius: 40,
        backgroundImage: NetworkImage(image),
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
        price,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }

  List<Map> data = [
    {
      'name': 'ABC',
      'Desc': 'Delicious food',
      'price': '\$500',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVGHL9r9OucwArH8yO3rEDPryG4V3tSCBw-w&usqp=CAU',
      'onClick': () => print('ABC'),
      'pickTime': '',
      'favorite': false,
    },
    {
      'name': 'XYZ',
      'Desc': 'Hiii',
      'price': '\$599',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVGHL9r9OucwArH8yO3rEDPryG4V3tSCBw-w&usqp=CAU',
      'onClick': () => print('XYZ'),
      'pickTime': '',
      'favorite': false,
    },
    {
      'name': 'PQR',
      'price': '\$599',
      'Desc': 'How are you?',
      'image':
          'https://images.all-free-download.com/images/graphiclarge/homemade_burger_560254.jpg',
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
  String desc = '';

  BottomSheetData(
      {this.desc = '',
      this.img = '',
      this.name = '',
      this.price = '',
      Key? key})
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
                  widget.desc,
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
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Card(
                color: Colors.grey,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      Text(
                        "Cheese",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "\$5",
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.grey,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      Text(
                        "Cheese",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "\$5",
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
              Card(
                color: Colors.grey,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      Text(
                        "Cheese",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "\$5",
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: Container(
              margin: EdgeInsets.all(20.0),
              width: 310,
              color: Colors.red,
              child: TextButton(
                onPressed: () {

                },
                child: Text(
                  "Add Cart",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
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
