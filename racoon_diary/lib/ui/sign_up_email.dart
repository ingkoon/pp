import 'package:flutter/material.dart';
import 'package:dd_racoon/resource/utils.dart';

import 'package:delayed_widget/delayed_widget.dart';
import 'package:get/get.dart';

class signUpEmail extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'signUpEmail',
      home: signUpEmailPage(),
    );
  }
}

class signUpEmailPage extends StatefulWidget {
  @override
  State<signUpEmailPage> createState() => signUpEmailPageState();
}

class signUpEmailPageState extends State<signUpEmailPage> {
  var dataVal = Get.arguments;
  final emailController = TextEditingController();
  final nicknameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
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
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: height * 0.05),
              child: IconButton(
                icon: const Icon(Icons.keyboard_arrow_left),
                color: Colors.white,
                iconSize: 50,
                onPressed: () {
                  Get.back();
                },
              ),
            ),
            Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: width * 0.05),
                child: DelayedWidget(
                  delayDuration: Duration(milliseconds: 150), // Not required
                  animationDuration: Duration(seconds: 1), // Not required
                  animation:
                      DelayedAnimations.SLIDE_FROM_BOTTOM, // Not required
                  child: Text('벌써 마지막이네요!\n이메일과 이름대신 \n사용할 닉네임을 \n입력해봐요!',
                      style: emailMessage()),
                )),
            Container(
                margin: EdgeInsets.only(
                    left: width * 0.05,
                    right: width * 0.05,
                    top: height * 0.1,
                    bottom: height * 0.05),
                child: const TextField(
                  decoration: InputDecoration(
                      labelText: '이메일을 입력해주세요',
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
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(width: 1, color: Colors.white),
                      ),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0)))),
                )),
            Container(
                margin: EdgeInsets.only(
                    left: width * 0.05,
                    right: width * 0.05,
                    bottom: height * 0.05),
                child: TextField(
                  controller: nicknameController,
                  decoration: const InputDecoration(
                      labelText: '닉네임을 입력해주세요',
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
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(width: 1, color: Colors.white),
                      ),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0)))),
                )),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(right: width * 0.05),
              child: FloatingActionButton.extended(
                backgroundColor: Color(0xFFb5d3b6),
                onPressed: () {
                  if (emailController.text.isEmpty ||
                      nicknameController.text.isEmpty) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return CustomDialog(
                            title: "정보가 이상하군요",
                            content: "잘못된 정보를 준다면 쿤이\n속상해한답니다. 정말 슬프죠?",
                            btnText: "슬프군요",
                            btnPressed: () {
                              // Do something here
                              Navigator.of(context).pop();
                            },
                          );
                        });
                  } else {
                    // Get.to(() => signUpInfo(), arguments: nameController.text);
                  }
                },
                icon: const Icon(Icons.keyboard_arrow_right),
                label: const Text("다음으로"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
