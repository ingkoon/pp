import 'package:flutter/material.dart';

//회원가입 이메일 입력 폰트
TextStyle emailMessage() {
  return const TextStyle(
    color: Colors.white,
    // fontFamily: 'Montserrat',
    fontWeight: FontWeight.bold,
    fontSize: 33.0,
  );
}

// 버튼 디자인 형식
TextStyle signUpButton() {
  return const TextStyle(
    color: Colors.white,
    // fontFamily: 'Montserrat',
    fontWeight: FontWeight.bold,
    fontSize: 25.0,
  );
}

// 빈칸에 대한 입력
class CustomDialog extends StatelessWidget {
  final String title, content, btnText;
  final GestureTapCallback btnPressed;

  CustomDialog({
    required this.title,
    required this.content,
    required this.btnText,
    required this.btnPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Container(
            // Bottom rectangular box
            margin: EdgeInsets.only(
                top: 40), // to push the box half way below circle
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: EdgeInsets.only(
                top: 60, left: 20, right: 20), // spacing inside the box
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  title,
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  content,
                  style: Theme.of(context).textTheme.bodyText2,
                  textAlign: TextAlign.center,
                ),
                TextButton(
                  child: Text(btnText, style: TextStyle(color: Colors.grey)),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),
          CircleAvatar(
            backgroundColor: Color(0xFFb5d3b6),
            // Top Circle with icon
            maxRadius: 40.0,
            child: Image.asset(
              "imgs/fill_racoon.png",
            ),
          ),
        ],
      ),
    );
  }
}

// Widget _buildDialogContent(BuildContext context) {
//   return Stack(
//     alignment: Alignment.topCenter,
//     children: <Widget>[
//       Container(
//         // Bottom rectangular box
//         margin:
//             EdgeInsets.only(top: 40), // to push the box half way below circle
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(12),
//         ),
//         padding: EdgeInsets.only(
//             top: 60, left: 20, right: 20), // spacing inside the box
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             Text(
//               title,
//               style: Theme.of(context).textTheme.headline5,
//             ),
//             SizedBox(
//               height: 16,
//             ),
//             Text(
//               content,
//               style: Theme.of(context).textTheme.bodyText2,
//               textAlign: TextAlign.center,
//             ),
//             TextButton(
//               child: Text(btnText),
//               onPressed: () => Navigator.of(context).pop(),
//             ),
//           ],
//         ),
//       ),
//       CircleAvatar(
//         // Top Circle with icon
//         maxRadius: 40.0,
//         child: Image.asset(
//           "imgs/fill_racoon.png",
//         ),
//       ),
//     ],
//   );
// }
