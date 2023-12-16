import 'package:neobis_flutter_chapter7/lorby/data/api/requests/login/login_user.dart';
import 'package:neobis_flutter_chapter7/lorby/data/api/requests/register/register_user.dart';
import 'package:neobis_flutter_chapter7/lorby/data/api/service/service_api.dart';
import 'package:neobis_flutter_chapter7/lorby/domain/models/login/logined_model.dart';
import 'package:neobis_flutter_chapter7/lorby/domain/models/register/registered_model.dart';

class ApiUtil {
  final LorbyService _lorbyService;
  ApiUtil(this._lorbyService);

  Future<LoginedModel> login({
    required String username,
    required String password,
  }) async {
    final user = LoginUser(
      username: username,
      password: password,
    );

    LoginedModel result = await _lorbyService.loginUser(user);
    return result;
  }

  Future<RegisteredModel> register({
    required String username,
    required String email,
    required String password,
  }) async {
    final user = RegisterUser(
      username: username,
      email: email,
      password: password,
    );

    RegisteredModel result = await _lorbyService.registerUser(user);
    return result;
  }
}
