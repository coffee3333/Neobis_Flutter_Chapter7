import 'package:neobis_flutter_chapter7/lorby/data/api/models/register/register_errors.dart';
import 'package:neobis_flutter_chapter7/lorby/data/api/models/register/register_success_model.dart';
import 'package:neobis_flutter_chapter7/lorby/domain/models/register/registered_model.dart';

class RegisteredModelMapper {
  static RegisteredModel fromApi(
      RegisterSuccessModel? successData, RegisterError? errorData) {
    if (successData != null) {
      return RegisteredModel(
        mail: successData.email,
        login: successData.username,
        errors: null,
      );
    }
    return RegisteredModel(
      mail: null,
      login: null,
      errors: errorData!.errors,
    );
  }
}
