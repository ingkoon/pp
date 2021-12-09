import 'package:flutter/material.dart';
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

class signUpEmailPageState extends State<signUpEmailPage> {
  final nameController = TextEditingController();
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
