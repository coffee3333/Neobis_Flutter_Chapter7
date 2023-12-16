import 'package:dio/dio.dart';
import 'package:neobis_flutter_chapter7/lorby/data/api/models/login/login_errors.dart';
import 'package:neobis_flutter_chapter7/lorby/data/api/models/login/login_success_model.dart';
import 'package:neobis_flutter_chapter7/lorby/data/api/models/register/register_errors.dart';
import 'package:neobis_flutter_chapter7/lorby/data/api/models/register/register_success_model.dart';
import 'package:neobis_flutter_chapter7/lorby/data/api/requests/login/login_user.dart';
import 'package:neobis_flutter_chapter7/lorby/data/api/requests/register/register_user.dart';
import 'package:neobis_flutter_chapter7/lorby/data/mappers/errors_mapper.dart';
import 'package:neobis_flutter_chapter7/lorby/data/mappers/logined_model_mapper.dart';
import 'package:neobis_flutter_chapter7/lorby/data/mappers/registered_model_mapper.dart';
import 'package:neobis_flutter_chapter7/lorby/dependencies/container/di_container.dart';
import 'package:neobis_flutter_chapter7/lorby/domain/models/login/logined_model.dart';
import 'package:neobis_flutter_chapter7/lorby/domain/models/register/registered_model.dart';

class LorbyService with ErrorsMapper {
  Future<LoginedModel> loginUser(LoginUser user) async {
    try {
      final response = await getIt.get<Dio>().post(
            '/login/',
            data: user.toJson(),
          );

      final successResponce =
          LoginSuccessModel.fromApi(response.data as Map<String, dynamic>);

      final mappedResponse = LoginedModelMapper.fromApi(successResponce, null);
      return mappedResponse;
    } on DioException catch (error) {
      if (error.response!.data != null) {
        print(error.response!.data);
        final LoginErrors errorResponce =
            LoginErrors(errors: convertMap(error.response!.data));
        final mappedResponse = LoginedModelMapper.fromApi(null, errorResponce);
        return mappedResponse;
      }
    }
    return LoginedModelMapper.fromApi(null, null);
  }

  Future<RegisteredModel> registerUser(RegisterUser user) async {
    try {
      final response = await getIt.get<Dio>().post(
            '/register/',
            data: user.toJson(),
          );
      final successResponce =
          RegisterSuccessModel.fromApi(response.data as Map<String, dynamic>);
      final mappedResponse =
          RegisteredModelMapper.fromApi(successResponce, null);
      return mappedResponse;
    } on DioException catch (error) {
      if (error.response!.data != null) {
        final RegisterError errorResponce =
            RegisterError(errors: convertMap(error.response!.data));
        final mappedResponse =
            RegisteredModelMapper.fromApi(null, errorResponce);
        return mappedResponse;
      }
    }
    return RegisteredModelMapper.fromApi(null, null);
  }
}
