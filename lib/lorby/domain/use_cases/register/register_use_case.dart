import 'package:neobis_flutter_chapter7/lorby/domain/models/register/register_model.dart';
import 'package:neobis_flutter_chapter7/lorby/domain/models/register/registered_model.dart';
import 'package:neobis_flutter_chapter7/lorby/domain/repository/service_repository.dart';

class RegisterUseCase {
  final ServiceRepository _repository;

  RegisterUseCase({required ServiceRepository repository})
      : _repository = repository;

  Future<RegisteredModel> call(RegisterModel params) {
    return _repository.registerUser(
      login: params.login,
      mail: params.mail,
      pass: params.pass,
    );
  }
}
