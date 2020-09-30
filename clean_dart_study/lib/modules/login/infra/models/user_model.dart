import 'package:clean_dart_study/modules/login/domain/entity/user_logged.dart';

class UserModel extends UserLogged {
  UserModel({String name, String email, String imgUrl, String token})
      : super(name: name, email: email, token: token, imgUrl: imgUrl);

  static UserModel fromJson(Map json) {
    return UserModel(
      email: json['name'],
      imgUrl: json['imgUrl'],
      name: json['name'],
      token: json['token'],
    );
  }
}
