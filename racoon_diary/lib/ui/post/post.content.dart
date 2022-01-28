// ignore_for_file:  unused_import,  file_names

import 'package:flutter/material.dart';

class PostContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'timeline',
      theme: ThemeData(),
      home: PostContentPage(),
    );
  }
}

class PostContentPage extends StatefulWidget {
  @override
  State<PostContentPage> createState() => PostContentPageState();
}

class PostContentPageState extends State<PostContentPage> {
  
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(children:<Widget>[
        Container(
         
          ),        
        ]),
    );
  }
}
