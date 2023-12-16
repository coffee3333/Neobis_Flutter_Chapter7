import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:neobis_flutter_chapter7/lorby/dependencies/container/di_container.dart';
import 'package:neobis_flutter_chapter7/lorby/domain/models/login/login_model.dart';
import 'package:neobis_flutter_chapter7/lorby/domain/models/login/logined_model.dart';
import 'package:neobis_flutter_chapter7/lorby/domain/use_cases/login/login_use_case.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  late LoginModel registerModel;
  final LoginUseCase registerCase = getIt.get<LoginUseCase>();

  void loginEvent(String login, String pass) async {
    emit(LoginIsLoading());
    registerModel = LoginModel(login: login, pass: pass);
    final LoginedModel response = await registerCase.call(registerModel);

    if (response.username != null) {
      emit(LoginDone());
    } else if (response.errors != null) {
      emit(LoginError(response.errors!));
    } else {
      print("unexpected error");
    }
  }
}
