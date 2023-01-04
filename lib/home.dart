import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:rahove_exam/profile_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title = 'Home';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  final bool _pinned = false;
  final bool _snap = false;
  final bool _floating = false;
  late int currentPage;
  late TabController tabController;

  final BorderRadius _borderRadius = const BorderRadius.only(
    topLeft: Radius.circular(25),
    topRight: Radius.circular(25),
  );

  ShapeBorder? bottomBarShape = const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(50)),
  );
  SnakeBarBehaviour snakeBarStyle = SnakeBarBehaviour.floating;
  EdgeInsets padding = const EdgeInsets.all(12);

  int _selectedItemPosition = 0;
  SnakeShape snakeShape = SnakeShape.circle;

  bool showSelectedLabels = false;
  bool showUnselectedLabels = false;

  Color selectedColor = Colors.black;
  Color unselectedColor = Colors.blueGrey;

  Gradient selectedGradient =
      const LinearGradient(colors: [Colors.red, Colors.amber]);
  Gradient unselectedGradient =
      const LinearGradient(colors: [Colors.red, Colors.blueGrey]);

  Color? containerColor;
  List<Color> containerColors = [
    const Color(0xFFFDE1D7),
    const Color(0xFFE4EDF5),
    const Color(0xFFE7EEED),
    const Color(0xFFF4E4CE),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: _pinned,
            snap: _snap,
            floating: _floating,
            expandedHeight: 500,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(width: 3, color: Colors.white)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ProfilePage()));
                    },
                    child: Image.asset(
                        fit: BoxFit.fitWidth,
                        'assets/images/selamina.jpg',
                        height: 35,
                        width: 35),
                  ),
                ),
              ),
            ),
            title: const Text('Home'),
            centerTitle: true,
            actions: [
              IconButton(
                  padding: EdgeInsets.only(right: 10),
                  onPressed: () {},
                  icon: const Icon(
                    size: 30,
                    Icons.account_balance,
                  ))
            ],
            flexibleSpace: FlexibleSpaceBar(
              // title: Text('Home'),
              background: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xff7e9fed), Color(0xffa273ed)])),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20, top: 90),
                      child: const Text(
                        'Hello Soliana',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: const Text(
                        'Let\'s check our status',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 300,
                      child:
                          ListView(scrollDirection: Axis.horizontal, children: [
                        SizedBox(
                          width: 12,
                        ),
                        HorizontalCard(
                          cardTitle: 'Feres Transport',
                          cardURL: 'http://www.feres.com',
                        ),
                        HorizontalCard(
                          cardTitle: 'Feres Transport',
                          cardURL: 'http://www.feres.com',
                        )
                      ]),
                    )
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Recent Operations',
                  style: TextStyle(color: Colors.purple)),
            ),
          ),
          SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, top: 8, bottom: 0),
                    child: Container(
                      child: Text(
                        'Today',
                        style: TextStyle(color: Colors.white70),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: Colors.black38),
                    ),
                  ),
                  PeopleTile(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Divider(height: 0, color: Colors.grey),
                  ),
                  PeopleTile(),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, right: 8, bottom: 8),
                    child: Divider(height: 0, color: Colors.grey),
                  ),
                ]);
          }, childCount: 25))
        ],
      ),
      bottomNavigationBar: SnakeNavigationBar.color(
        // height: 80,
        behaviour: snakeBarStyle,
        snakeShape: snakeShape,
        shape: bottomBarShape,
        padding: padding,

        ///configuration for SnakeNavigationBar.color
        snakeViewColor: selectedColor,
        selectedItemColor: Theme.of(context).primaryColor,
        //snakeShape == SnakeShape.indicator ? selectedColor : null,
        unselectedItemColor: unselectedColor,

        ///configuration for SnakeNavigationBar.gradient
        // snakeViewGradient: selectedGradient,
        // selectedItemGradient: snakeShape == SnakeShape.indicator ? selectedGradient : null,
        // unselectedItemGradient: unselectedGradient,

        showUnselectedLabels: showUnselectedLabels,
        showSelectedLabels: showSelectedLabels,

        currentIndex: _selectedItemPosition,
        onTap: (index) {
          setState(() => _selectedItemPosition = index);
          if (index == 3) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ProfilePage()));
          }
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart), label: 'calendar'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_box_rounded), label: 'microphone'),
          BottomNavigationBarItem(icon: Icon(Icons.face), label: 'profile')
        ],
        selectedLabelStyle: const TextStyle(fontSize: 14),
        unselectedLabelStyle: const TextStyle(fontSize: 10),
      ),
    );
  }
}

class HorizontalCard extends StatelessWidget {
  final String cardTitle;
  final String cardURL;
  final List<Feature> features = [
    Feature(
      title: "Drink Water",
      color: Colors.green,
      data: [
        0.1,
        0.1,
        0.1,
        0.1,
        0.4,
        0.1,
        0.1,
        0.3,
        0.1,
        0.4,
        0.1,
        0.1,
        0.1,
        0.3,
        0.3,
        0.1,
        0.8,
        0.1,
        0.4,
        0.1,
        0.1
      ],
    ),
    /*
    Feature(
      title: "Exercise",
      color: Colors.grey,
      data: [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
    ),
    Feature(
      title: "Study",
      color: Colors.grey,
      data: [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    ),

    Feature(
      title: "Water Plants",
      color: Colors.green,
      data: [0.6, 0.2, 0, 0.1, 1],
    ),
    Feature(
      title: "Grocery Shopping",
      color: Colors.amber,
      data: [0.25, 1, 0.3, 0.8, 0.6],
    ),

     */
  ];

  HorizontalCard({Key? key, required this.cardTitle, required this.cardURL})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12, left: 8, top: 8, bottom: 8),
      child: Container(
        height: 150,
        width: 355,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24), color: Colors.white),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 16, bottom: 8.0, left: 8, right: 8),
                    child: Row(children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0, right: 8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Image.asset(
                            'assets/images/feres.jpeg',
                            fit: BoxFit.fitHeight,
                            height: 35,
                            width: 35,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 4.0),
                            child: Text(
                              cardTitle,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w700),
                            ),
                          ),
                          Text(
                            cardURL,
                            style: const TextStyle(fontSize: 11),
                          )
                        ],
                      )
                    ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.grey,
                      )),
                )
              ],
            ),
            const Divider(
              color: Colors.grey,
              height: 5,
              thickness: 2,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(height: 15),
                      Text('500'),
                      SizedBox(height: 135),
                      Text('0')
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: 313,
                        height: 3,
                        child: DottedLine(
                          direction: Axis.horizontal,
                          lineLength: double.infinity,
                          lineThickness: 1.0,
                          dashLength: 8.0,
                          dashColor: Colors.grey,
                          dashRadius: 2.0,
                          dashGapLength: 6,
                          dashGapColor: Colors.transparent,
                          dashGapRadius: 0.0,
                        ),
                      ),
                      LineGraph(
                        features: features,
                        size: const Size(313, 150),
                        labelX: const [
                          '0',
                          '1',
                          '2',
                          ' 3',
                          ' 4',
                          ' 5',
                          '6',
                          '7',
                          '8',
                          '9',
                          '10',
                          '11',
                          '12',
                          '13',
                          '14',
                          '15',
                          '16',
                          '17',
                          '18',
                          '19',
                          '20'
                        ],
                        labelY: const [''],
                        showDescription: false,
                        graphOpacity: 0,
                        verticalFeatureDirection: false,
                        graphColor: Colors.white,
                        descriptionHeight: 0,
                      ),
                      Container(
                        width: 313,
                        height: 3,
                        child: const DottedLine(
                          direction: Axis.horizontal,
                          //lineLength: double.infinity,
                          lineThickness: 1.0,
                          dashLength: 8.0,
                          dashColor: Colors.grey,
                          dashRadius: 0.0,
                          dashGapLength: 6.0,
                          dashGapColor: Colors.transparent,
                          dashGapRadius: 0.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PeopleTile extends StatelessWidget {
  const PeopleTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8),
      child: ListTile(
        tileColor: Colors.black12.withOpacity(0.03),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => ProfilePage()));
            },
            child: Image.network('https://picsum.photos/250?image=9',
                height: 45, width: 45),
          ),
        ),
        title: Text(
          "Yonas Tesfaye",
        ),
        subtitle: Text(
          '+251 939 09 0908',
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.w300),
        ),
        trailing: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Container(
            width: 100,
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.green,
                      size: 12,
                    ),
                    Text('1000.2 '),
                    Text(
                      'ETB',
                      style: TextStyle(
                          fontWeight: FontWeight.w200, color: Colors.grey),
                    )
                  ],
                ),
                Text(
                  '04:08AM',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                      fontWeight: FontWeight.w100),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// style: Theme.of(context).textTheme.headline4,

// Invoke "debug painting" (press "p" in the console, choose the
// "Toggle Debug Paint" action from the Flutter Inspector in Android
// Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
// to see the wireframe for each widget.
//
// Column has various properties to control how it sizes itself and
// how it positions its children. Here we use mainAxisAlignment to
// center the children vertically; the main axis here is the vertical
// axis because Columns are vertical (the cross axis would be
// horizontal).

//Failed attempt to implement the floating naviagtion coming at you below
// Container(
// //height: 150,
// // decoration: BoxDecoration(
// //   boxShadow: [
// // BoxShadow(blurRadius: 20, color: Colors.white),
// //],
// // borderRadius: BorderRadius.all(Radius.circular(50))),
// child: SafeArea(
// child: Padding(
// padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
// child: ClipRRect(
// borderRadius: BorderRadius.circular(200),
// child: GNav(
// backgroundColor: Colors.white,
// duration: Duration(seconds: 2),
// curve: Curves.easeInCirc,
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// // gap: 10,
// iconSize: 25,
// activeColor: Theme.of(context).primaryColor,
// style: GnavStyle.oldSchool,
// tabs: [
// GButton(icon: Icons.home, style: GnavStyle.google),
// GButton(icon: Icons.graphic_eq),
// GButton(icon: Icons.adb_sharp),
// GButton(icon: Icons.person)
// ]),
// ),
// ),
// ),
// ),
