class LoginSuccessModel {
  final String username;
  final String refreshToken;
  final String accessToken;

  LoginSuccessModel({
    required this.username,
    required this.refreshToken,
    required this.accessToken,
  });

  LoginSuccessModel.fromApi(Map<String, dynamic> map)
      : username = map["username"],
        refreshToken = map["tokens"]["refresh"],
        accessToken = map["tokens"]["access"];
}
