import 'package:flutter/material.dart';

void main() {
  runApp(const TabDisplay());
}

class TabDisplay extends StatefulWidget {
  const TabDisplay({super.key});

  @override
  State<TabDisplay> createState() => _TabDisplayState();
}

class _TabDisplayState extends State<TabDisplay>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    //TabController has arbitrary length but also needs vsync
    _tabController = TabController(length: 4, vsync: this);

    //Have a listener sequence to rebuild state after tab changes.
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TabDisplay",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: const Text(
            "TabBarView!",
            style: TextStyle(color: Colors.white),
          ),
          // TabBar is now in the AppBar's bottom property
          bottom: TabBar(
            controller:
                _tabController, //TabBar to TaBController! TaBController controls amount OF TABBBS!
            labelColor: Colors.amberAccent, //Icon colour
            unselectedLabelColor: Colors.white70, //Unselected get white
            //Some constructor properties below
            indicatorColor: Colors.blue, //Underline COLOR!!!
            indicatorWeight: 4.0, //weight of thing below
            tabs: [
              Tab(
                //Tab1
                icon: Icon(
                  Icons.monitor_heart_sharp,
                  // Javascript ahhhh operations right here
                  size: _tabController.index == 0 ? 35.0 : 25.0,
                ),
              ),
              Tab(
                //Tab2
                icon: Icon(
                  Icons.golf_course_outlined,
                  size: _tabController.index == 1 ? 35.0 : 25.0,
                ),
              ),
              Tab(
                //Tab3
                icon: Icon(
                  Icons.music_note_rounded,
                  size: _tabController.index == 2 ? 35.0 : 25.0,
                ),
              ),
              Tab(
                //Tab4
                icon: Icon(
                  Icons.work_outline,
                  size: _tabController.index == 3 ? 35.0 : 25.0,
                ),
              ),
              //Define new tab here
            ],
          ),
        ),
        body: TabBarView(
          controller:
              _tabController, //LINKING TabBarView to TabController! So they have their own spaces.
          children: const [
            Center(
              //First tabb
              child: Text(
                'MY HEART FLUTTERS FOR FLUTTER',
                style: TextStyle(
                  fontSize: 40.00000000000000000000000000000000000000,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                  fontStyle: FontStyle.italic,
                  letterSpacing: 1.2,
                ),
              ),
            ),
            Center(
              //Second Tab
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center vertically
                crossAxisAlignment:
                    CrossAxisAlignment.center, // Center horizontally
                children: [
                  CircleAvatar(
                    radius: 100,
                    backgroundColor: Color.fromARGB(255, 72, 138, 172),
                    child: Icon(Icons.person, size: 70, color: Colors.white),
                  ),
                  SizedBox(height: 25),
                  Text(
                    'FlutterFAN01111', // Profile Name
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  SizedBox(height: 12), // Spacing
                  Text(
                    'SOCIAL MEDDIIIAAAAAA APPP NOWWWWW', // Bio/Status
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  SizedBox(height: 20), // Spacing
                  // You can add more elements here like follower count, etc.
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            '120,000',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Followers',
                            style: TextStyle(fontSize: 24, color: Colors.grey),
                          ),
                        ],
                      ),
                      SizedBox(width: 30),
                      Column(
                        children: [
                          Text(
                            '500000',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Following',
                            style: TextStyle(fontSize: 24, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Center(
              child: Text(
                'PAGE FOR POSTS',
                style: TextStyle(fontSize: 40.000000000002),
              ),
            ),
            Center(
              child: Text(
                'PAGE FOR HISTORY',
                style: TextStyle(fontSize: 40.000000000003),
              ),
            ), //Put new tab under here
          ],
        ),
      ),
    );
  }
}
