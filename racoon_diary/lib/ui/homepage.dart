import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import './post/postPage.dart';
import './post/post.content.dart';
import 'package:get/get.dart';

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'RCD',
        theme: ThemeData(),
        home: homePage(),
        getPages: [
          GetPage(name: '/postContent', page: () => PostContent()),
        ]);
  }
}

class homePage extends StatefulWidget {
  @override
  State<homePage> createState() => homePageState();
}

class homePageState extends State<homePage> {
  var _bottomNavIndex = 0; //default index of a first screen

  final iconList = <IconData>[
    Icons.access_time,
    Icons.article_outlined,
    Icons.alternate_email,
    Icons.account_circle_outlined,
  ];

  static List<Widget> widgetList = <Widget>[
    TimeLinePage(),
    Text('2'),
    Text('3'),
    Text('4'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Koon\s Diary',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        toolbarHeight: 70,
      ),
      floatingActionButton: FloatingActionButton(
        hoverElevation: 30,
        //params
        backgroundColor: Colors.white,
        child: Icon(
          Icons.add_rounded,
          color: Colors.black,
          size: 35,
        ),
        onPressed: () {},
      ),
      body: IndexedStack(
        index: _bottomNavIndex,
        children: widgetList,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        iconSize: 26,
        activeIndex: _bottomNavIndex,
        activeColor: Color(0xFFb5d3b6),
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.defaultEdge,
        onTap: (index) => setState(() => _bottomNavIndex = index),
        //other params
      ),
    );
  }
}
