import 'package:flutter/material.dart';
import 'package:draw_graph/draw_graph.dart';

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

class _MyHomePageState extends State<MyHomePage> {
  final bool _pinned = true;
  final bool _snap = false;
  final bool _floating = true;

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
                  child: Image.asset(
                    fit: BoxFit.fitWidth,
                    '../assets/images/selamina.jpg',
                    height: 35,
                    width: 35,
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
                    SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: const Text(
                        'Hello Soliana',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: const Text(
                        'Let\'s check our status',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 300,
                      child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: const [
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
          SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
            return Container(
              color: index.isOdd ? Colors.white : Colors.grey,
              height: 50,
              child: Center(
                  child: Text(
                '$index',
                textScaleFactor: 3,
              )),
            );
          }, childCount: 25))
        ],
      ),
    );
  }
}

class HorizontalCard extends StatelessWidget {
  final String cardTitle;
  final String cardURL;

  const HorizontalCard(
      {Key? key, required this.cardTitle, required this.cardURL})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        height: 200,
        width: 400,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24), color: Colors.white),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0, right: 8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Image.asset(
                            '../assets/images/feres.jpeg',
                            fit: BoxFit.fitHeight,
                            height: 35,
                            width: 35,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            cardTitle,
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          Text(
                            cardURL,
                            style: TextStyle(fontSize: 8),
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
                      icon: Icon(
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
            LineGraph(
              features: features,
              size: Size(320, 400),
              labelX: ['Day 1', 'Day 2', 'Day 3', 'Day 4', 'Day 5'],
              labelY: ['20%', '40%', '60%', '80%', '100%'],
              showDescription: true,
              graphColor: Colors.white30,
              graphOpacity: 0.2,
              verticalFeatureDirection: true,
              descriptionHeight: 130,
            ),
          ],
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
