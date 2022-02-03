import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
// ignore_for_file:  unused_import,  file_names, prefer_const_constructors


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
  List<int> emotion = [0, 0, 0, 0];
  final textController = TextEditingController();
  String dateTime = DateFormat.yMMMd('en_US').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    void dispose() {
      textController.dispose();
      super.dispose();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      //컨테이너 생성
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        // 일자로 맹글기 위해 컬럼 위젯 생성
        child: Column(children: <Widget>[
          Container(
            height: height * 0.05,
            margin: EdgeInsets.only(top: height * 0.02),
            alignment: Alignment.centerLeft,
            child: Row(children: <Widget>[
              IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  iconSize: 27,
                  onPressed: () {
                    // Navigator.of(context, rootNavigator: true).pop(context);
                    Get.back();
                  }),
              Container(
                
                margin: EdgeInsets.only(top: height * 0.01),
                child: Text(dateTime,style: const TextStyle(fontSize: 27),))
              
            ]),
          ),

          Container(
            height: height * 0.1,
            margin: EdgeInsets.only(top: height * 0.05),
            child: TextField(
              controller: textController,
              decoration: const InputDecoration(
                labelText: 'Title',
                labelStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                    borderSide: BorderSide(width: 1, color: Colors.black)),
              ),
            ),
          ),

          Container(
            height: height * 0.4,
            child:
              TextField(
                maxLines: 15, 
                decoration: InputDecoration(
                    labelText: 'Contents',
                    labelStyle: const TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white, 
                    enabledBorder: 
                    OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                    borderSide: BorderSide(width: 1, color: Colors.white),
                          ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        borderSide: BorderSide(width: 1, color: Colors.black)),
                  ),
              ),
          ),    
           FloatingActionButton(
        hoverElevation: 30,
        //params
        backgroundColor: Colors.white,
        child: Icon(
          Icons.check_circle_outline_rounded ,
          color: Colors.black,
          size: 35,
        ),
        onPressed: () {
          Get.back();
        },
      ),    
        ]),
      ),
    );
  }
}