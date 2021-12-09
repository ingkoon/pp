class Env {
  static String URL_PREFIX = "http://127.0.0.1:8000";
}

class User {
  final String userID;
  final String pwd;
  final String name;
  final String nickname;
  final String email;
  final String birth;

  User(
      {required this.userID,
      required this.pwd,
      required this.name,
      required this.nickname,
      required this.email,
      required this.birth});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userID: json['userID'],
      pwd: json['pwd'],
      name: json['name'],
      nickname: json['nickname'],
      email: json['email'],
      birth: json['birth'],
    );
  }

  Map<String, dynamic> toJson() => {
        'userID': userID,
        'pwd': pwd,
        'name': name,
        'nickname': nickname,
        'email': email,
        'birth': birth,
      };
}
