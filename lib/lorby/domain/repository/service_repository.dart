import 'package:neobis_flutter_chapter7/lorby/domain/models/login/logined_model.dart';
import 'package:neobis_flutter_chapter7/lorby/domain/models/register/registered_model.dart';

abstract class ServiceRepository {
  Future<RegisteredModel> registerUser({
    required String mail,
    required String login,
    required String pass,
  });

  Future<LoginedModel> loginUser({
    required String login,
    required String pass,
  });
}
