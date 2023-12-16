class RegisterSuccessModel {
  final String username;
  final String email;

  RegisterSuccessModel({
    required this.username,
    required this.email,
  });

  RegisterSuccessModel.fromApi(Map<String, dynamic> map)
      : username = map["username"],
        email = map["email"];
}
