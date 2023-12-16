import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:neobis_flutter_chapter7/lorby/data/api/api_util.dart';
import 'package:neobis_flutter_chapter7/lorby/data/api/service/service_api.dart';
import 'package:neobis_flutter_chapter7/lorby/data/repository/service_data_repository.dart';
import 'package:neobis_flutter_chapter7/lorby/domain/use_cases/login/login_use_case.dart';
import 'package:neobis_flutter_chapter7/lorby/domain/use_cases/register/register_use_case.dart';

final getIt = GetIt.instance;
const String _base_url = "http://146.190.232.227:8000/api";

void setupDi() {
  getIt.registerSingleton<Dio>(Dio(BaseOptions(baseUrl: _base_url)));
  getIt.registerSingleton<ServiceDataRepository>(
      ServiceDataRepository(ApiUtil(LorbyService())));
  getIt.registerSingleton<LoginUseCase>(
      LoginUseCase(repository: getIt.get<ServiceDataRepository>()));
  getIt.registerSingleton<RegisterUseCase>(
      RegisterUseCase(repository: getIt.get<ServiceDataRepository>()));
}
