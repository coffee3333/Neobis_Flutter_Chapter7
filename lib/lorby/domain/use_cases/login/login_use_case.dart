import 'package:neobis_flutter_chapter7/lorby/domain/models/login/login_model.dart';
import 'package:neobis_flutter_chapter7/lorby/domain/models/login/logined_model.dart';
import 'package:neobis_flutter_chapter7/lorby/domain/repository/service_repository.dart';

class LoginUseCase {
  final ServiceRepository _repository;

  LoginUseCase({required ServiceRepository repository})
      : _repository = repository;

  Future<LoginedModel> call(LoginModel params) {
    return _repository.loginUser(
      login: params.login,
      pass: params.pass,
    );
  }
}
