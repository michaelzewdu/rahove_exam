import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool streched = true;

  double imageBorder = 3;
  double collapsedImageContainerWidth = 150;
  double collapsedImageContainerHeight = 150;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            snap: false,
            pinned: true,
            expandedHeight: 400,
            leading: TextButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.white,
              ),
              label: Text(
                'Back',
                style: TextStyle(color: Colors.white),
              ),
            ),

            leadingWidth: 100,
            foregroundColor: Colors.white,
            primary: true,
            stretch: true,
            stretchTriggerOffset: 1,
            onStretchTrigger: () async {
              print('Streched');
              setState(() {
                streched = true;
              });
            },
            flexibleSpace: LayoutBuilder(builder: (context, constraints) {
              print("Height:" + constraints.maxHeight.toString());
              if (constraints.maxHeight < 390) {
                streched = false;
                collapsedImageContainerWidth = 120;
                collapsedImageContainerHeight = 120;
              } else if (constraints.maxHeight < 310) {
                setState(() {
                  streched = false;

                  collapsedImageContainerWidth = 100;
                  collapsedImageContainerHeight = 100;
                });
              } else if (constraints.maxHeight < 210) {
                setState(() {
                  streched = false;

                  collapsedImageContainerWidth = 50;
                  collapsedImageContainerHeight = 50;
                });
              } else {
                streched = true;
              }
              return FlexibleSpaceBar(
                // title: Text('Home'),

                background: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xff7e9fed), Color(0xffa273ed)]),
                        image: DecorationImage(
                            fit: BoxFit.fitWidth,
                            opacity: streched ? 1 : 0,
                            image:
                                AssetImage('../assets/images/selamina.jpg'))),
                    child: !streched
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AnimatedContainer(
                                  height: collapsedImageContainerHeight,
                                  width: collapsedImageContainerWidth,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                        width: imageBorder,
                                        color: Colors.white),
                                  ),
                                  duration: Duration(seconds: 1),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Expanded(
                                        child: Image.asset(
                                          fit: BoxFit.fitWidth,
                                          '../assets/images/selamina.jpg',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'Liya Dereje',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 22),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'liyadereje2@gmail.com',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w100,
                                            fontSize: 12),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          collapsedImageContainerWidth = 50;
                                          collapsedImageContainerHeight = 50;
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(
                                          'Edit Profile',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(40)))),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        : Column(
                            children: [
                              SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: 300),
                              Container(
                                height: 100,
                                width: MediaQuery.of(context).size.width,
                                color: Colors.white30,
                                padding: EdgeInsets.all(16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 0, bottom: 4.0),
                                          child: Text(
                                            'Liya Dereje',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 0, top: 8.0),
                                          child: Text(
                                            'liyadereje2@gmail.com',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w200,
                                                fontSize: 10),
                                          ),
                                        )
                                      ],
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(
                                          'Edit Profile',
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(40)))),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )),
              );
            }),
            // bottom: PreferredSize(
            //     preferredSize: Size(200, 200),
            //     child: streched
            //         ? Container(
            //             color: Colors.white24,
            //             padding: EdgeInsets.all(16),
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 Column(
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     Padding(
            //                       padding: const EdgeInsets.only(
            //                           left: 0, bottom: 8.0),
            //                       child: Text(
            //                         'Liya Dereje',
            //                         style: TextStyle(
            //                             color: Colors.white, fontSize: 18),
            //                       ),
            //                     ),
            //                     Text(
            //                       'liyadereje2@gmail.com',
            //                       style: TextStyle(
            //                           color: Colors.white,
            //                           fontWeight: FontWeight.w200,
            //                           fontSize: 10),
            //                     )
            //                   ],
            //                 ),
            //                 ElevatedButton(
            //                   onPressed: () {},
            //                   child: Text(
            //                     'Edit Profile',
            //                   ),
            //                   style: ElevatedButton.styleFrom(
            //                       shape: RoundedRectangleBorder(
            //                           borderRadius: BorderRadius.all(
            //                               Radius.circular(30)))),
            //                 )
            //               ],
            //             ),
            //           )
            //         : Container()),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Icon(Icons.notifications),
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Notification'),
                    ),
                    trailing: Text(
                      '4',
                      textScaleFactor: 1.75,
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    iconColor: Color(0xffa273ed),
                  ),
                );
              },
              childCount: 40,
            ),
          ),
        ],
      ),
    );
  }
}
