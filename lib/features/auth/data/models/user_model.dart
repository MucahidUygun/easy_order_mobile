import 'package:easy_order_mobile/features/auth/domain/entities/user.dart';

class UserModel extends User {
  UserModel(
      {required super.id, required super.email, required super.accessToken});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'], email: json['email'], accessToken: json['accessToken']);
  }
}
