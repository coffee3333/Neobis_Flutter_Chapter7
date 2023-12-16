import 'package:neobis_flutter_chapter7/lorby/data/api/api_util.dart';
import 'package:neobis_flutter_chapter7/lorby/domain/models/login/logined_model.dart';
import 'package:neobis_flutter_chapter7/lorby/domain/models/register/registered_model.dart';
import 'package:neobis_flutter_chapter7/lorby/domain/repository/service_repository.dart';

class ServiceDataRepository extends ServiceRepository {
  final ApiUtil _apiUtil;

  ServiceDataRepository(this._apiUtil);

  @override
  Future<LoginedModel> loginUser(
      {required String login, required String pass}) async {
    return _apiUtil.login(username: login, password: pass);
  }

  @override
  Future<RegisteredModel> registerUser(
      {required String mail,
      required String login,
      required String pass}) async {
    return _apiUtil.register(username: login, email: mail, password: pass);
  }
}
