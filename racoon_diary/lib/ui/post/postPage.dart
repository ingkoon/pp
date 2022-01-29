// ignore_for_file:  unused_import,  file_names

import 'package:flutter/material.dart';
import 'package:dd_racoon/resource/timeline/postCard.dart';
import 'package:carousel_slider/carousel_slider.dart';

class TimeLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'timeline',
      theme: ThemeData(),
      home: TimeLinePage(),
    );
  }
}

class TimeLinePage extends StatefulWidget {
  @override
  State<TimeLinePage> createState() => TimeLinePageState();
}

class TimeLinePageState extends State<TimeLinePage> {
  
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(children:<Widget>[
        Container(
          height:height* 0.3,
          margin: EdgeInsets.only(top: height * 0.03, bottom: height * 0.03), 
          child:timeLineCard,
          ),
        Container(
          width:width* 0.9,
          height: height * 0.35,
          color: Colors.green,
            child: Text("이날은 ~~~한 날이었지"),
          ),
        ]),
    );
  }
}
