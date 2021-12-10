import 'package:flutter/cupertino.dart';
import 'package:cupertino_date_textbox/cupertino_date_textbox.dart';

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:dd_racoon/resource/utils.dart';
import 'package:delayed_widget/delayed_widget.dart';
import 'package:get/get.dart';
import 'sign_up_data.dart';

// 기본 stateless 위젯
class signUpEmail extends StatelessWidget {
  signUpEmail({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'signUp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: signUpEmailPage(),
    );
  }
}

class signUpEmailPage extends StatefulWidget {
  @override
  State<signUpEmailPage> createState() => signUpEmailPageState();
}

// const String MIN_DATETIME = '1970-01-01';
// const String MAX_DATETIME = '2021-11-25';
// const String INIT_DATETIME = '2021-01-01';
// const String DATE_FORMAT = 'MM월|d일,yyyy년';

class signUpEmailPageState extends State<signUpEmailPage> {
  //텍스트필드 컨트롤러, 날짜 받아오기 위한 설정
  final nameController = TextEditingController();

  // 생일 변수를 받아오기 위한 함수 지정
  DateTime _selectedDateTime = DateTime.now();
  void onBirthdayChange(DateTime birthday) {
    setState(() {
      _selectedDateTime = birthday;
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final initDate = DateFormat('yyyy-MM-dd').parse('2000-01-01');

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFb1a8c0),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xFFb1a8c0),
            Color(0xFFf6d0ca),
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
                  child: Text('쿤이 당신의 이름을\n궁금해 하네요!', style: emailMessage()),
                )),
            Container(
                margin: EdgeInsets.only(
                    left: width * 0.05,
                    right: width * 0.05,
                    top: height * 0.1,
                    bottom: height * 0.05),
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                      labelText: '이름을 입력해주세요',
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
              child: CupertinoDateTextBox(
                color: Colors.grey,
                initialValue: initDate,
                hintColor: Colors.white,
                onDateChange: onBirthdayChange,
                hintText: ("Select your birthday"),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(right: width * 0.05),
              child: FloatingActionButton.extended(
                backgroundColor: Color(0xFFb5d3b6),
                onPressed: () {
                  if (nameController.text.isEmpty) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return CustomDialog(
                            title: "이름이 없네요",
                            content: "이름을 적지 않는다면 쿤이 당신의 이름을\n알지 못해요.정말 슬프죠?",
                            btnText: "슬프군요",
                            btnPressed: () {
                              // Do something here
                              Navigator.of(context).pop();
                            },
                          );
                        });
                  } else {
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(_selectedDateTime);
                    print(formattedDate);
                    Get.to(() => signUpInfo(), arguments: nameController.text);
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
