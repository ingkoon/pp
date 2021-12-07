import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RCD',
      theme: ThemeData(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFb1a8c0),

      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xFFb1a8c0),
            Color(0xFFf6d0ca),
            // Color(0xFFb5d3b6),
          ],
        )),
        child: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Image.asset(
                  "imgs/fill_racoon.png",
                  width: width * 0.45,
                ),
              ),
              Container(
                  margin: EdgeInsets.only(bottom: height * 0.03),
                  child: DefaultTextStyle(
                    style: const TextStyle(
                        fontFamily: 'Agne',
                        fontSize: 20.0,
                        fontWeight: FontWeight.w900),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        WavyAnimatedText('너구리의 일기장'),
                        WavyAnimatedText('Racoon\'s Diary'),
                      ],
                      isRepeatingAnimation: true,
                      onTap: () {
                        print("Tap Event");
                      },
                    ),
                  )),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.17, vertical: height * 0.03),
                child: const TextField(
                  decoration: InputDecoration(
                      labelText: 'ID',
                      labelStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          borderSide:
                              BorderSide(width: 1, color: Colors.white)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(width: 1, color: Colors.white),
                      ),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0)))),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: width * 0.17),
                child: const TextField(
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                      labelText: 'PassWord',
                      labelStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          borderSide:
                              BorderSide(width: 1, color: Colors.white)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(width: 1, color: Colors.white),
                      ),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0)))),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: height * 0.03),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        width: width * 0.25,
                        margin: EdgeInsets.only(right: width * 0.05),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Color(0xFFb5d3b6),
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.05)),
                            onPressed: () {
                              print("Tap Event");
                            },
                            child: const Text(
                              '회원 가입',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ))),
                    Container(
                        width: width * 0.25,
                        margin: EdgeInsets.only(left: width * 0.05),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Color(0xFFb5d3b6),
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.05)),
                            onPressed: () {
                              print("Tap Event");
                            },
                            child: const Text(
                              '로그인',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ))),
                  ],
                ),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    '아이디 혹은 비밀번호를 잊어버리셨나요?',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                        decoration: TextDecoration.underline),
                  ))
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
