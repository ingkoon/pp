import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:delayed_widget/delayed_widget.dart';
import 'sign_up_name.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RCD',
      theme: ThemeData(),
      home: SignInPage(),
      getPages: [GetPage(name: '/page2', page: () => signUpEmail())],
    );
  }
}

class SignInPage extends StatefulWidget {
  @override
  State<SignInPage> createState() => SignInPageState();
}

class SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFFb1a8c0),
      resizeToAvoidBottomInset: false,
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  child: DelayedWidget(
                delayDuration: Duration(milliseconds: 3000), // Not required
                animationDuration: Duration(seconds: 1), // Not required
                animation: DelayedAnimations.SLIDE_FROM_TOP, // Not required
                child: Image.asset(
                  "imgs/fill_racoon.png",
                  width: width * 0.5,
                ),
              )
                  // child:
                  ),
              Container(
                  margin: EdgeInsets.only(
                      top: height * 0.01, bottom: height * 0.03),
                  child: DefaultTextStyle(
                    style: const TextStyle(
                        fontFamily: 'Agne',
                        fontSize: 20.0,
                        fontWeight: FontWeight.w900),
                    child: AnimatedTextKit(
                      // repeatForever: true,
                      animatedTexts: [
                        // WavyAnimatedText('쿤의 일기장'),
                        WavyAnimatedText('Koon\'s Diary'),
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
                      labelText: '아이디 혹은 이메일',
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
                      labelText: '비밀번호',
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
                              Get.toNamed('/page2');
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
              Container(
                  child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(primary: Colors.grey),
                      child: const Text(
                        '아이디 혹은 비밀번호를 잊어버리셨나요?',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                            decoration: TextDecoration.underline),
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
