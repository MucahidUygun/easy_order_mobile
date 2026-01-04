class LoginResponseModel {
  final String token;
  final DateTime expiration;

  LoginResponseModel({required this.token, required this.expiration});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
        token: json['token'], expiration: DateTime.parse(json['expiration']));
  }
}
