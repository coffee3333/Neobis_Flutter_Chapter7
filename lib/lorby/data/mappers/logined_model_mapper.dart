import 'package:neobis_flutter_chapter7/lorby/data/api/models/login/login_errors.dart';
import 'package:neobis_flutter_chapter7/lorby/data/api/models/login/login_success_model.dart';
import 'package:neobis_flutter_chapter7/lorby/domain/models/login/logined_model.dart';

class LoginedModelMapper {
  static LoginedModel fromApi(
      LoginSuccessModel? successData, LoginErrors? errorData) {
    if (successData != null) {
      return LoginedModel(
        username: successData.username,
        refreshToken: successData.refreshToken,
        accessToken: successData.accessToken,
        errors: null,
      );
    }
    return LoginedModel(
      username: null,
      refreshToken: null,
      accessToken: null,
      errors: errorData!.errors,
    );
  }
}
