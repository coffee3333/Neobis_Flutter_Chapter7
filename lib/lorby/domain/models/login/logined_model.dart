class LoginedModel {
  final String? username;
  final String? refreshToken;
  final String? accessToken;
  final List<String>? errors;

  LoginedModel({
    required this.username,
    required this.refreshToken,
    required this.accessToken,
    required this.errors,
  });
}
