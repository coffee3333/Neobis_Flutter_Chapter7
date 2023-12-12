import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:neobis_flutter_chapter7/lorby/presentation/registration_page/cubit/register_validation.dart';
import 'package:rxdart/rxdart.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> with RegisterValidation {
  RegisterCubit() : super(RegisterInitial());
  final String _errorMsg = "Error empty data";

  //Text field controllers
  final _mailController = BehaviorSubject<String>();
  final _loginController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _repeatPasswordController = BehaviorSubject<String>();

  //Indicators controllers
  final _rangeIndicatorController = BehaviorSubject<bool>();
  final _registerIndicatorController = BehaviorSubject<bool>();
  final _minNumIndicatorController = BehaviorSubject<bool>();
  final _minSymbolIndicatorController = BehaviorSubject<bool>();
  final _spaceIndicatorController = BehaviorSubject<bool>();

  //Getting datas from the streams
  Stream<String> get mailStream => _mailController.stream;
  Stream<String> get loginStream => _loginController.stream;
  Stream<String> get passwordStream => _passwordController.stream;
  Stream<String> get repeatPasswordStream => _repeatPasswordController.stream;

  Stream<bool> get rangeIndicator => _rangeIndicatorController.stream;
  Stream<bool> get registerIndicator => _registerIndicatorController.stream;
  Stream<bool> get minNumIndicator => _minNumIndicatorController.stream;
  Stream<bool> get minSymbolIndicator => _minSymbolIndicatorController.stream;
  Stream<bool> get spaceIndicator => _spaceIndicatorController.stream;

  //Updating passwords
  void updatePassword(String password) {
    //Checking data for excisting, and notify with errors streams
    if (password.isEmpty) {
      _passwordController.sink.addError(_errorMsg);
      _rangeIndicatorController.sink.addError(_errorMsg);
      _registerIndicatorController.sink.addError(_errorMsg);
      _minNumIndicatorController.sink.addError(_errorMsg);
      _minSymbolIndicatorController.sink.addError(_errorMsg);
      _spaceIndicatorController.sink.addError(_errorMsg);
    } else {
      _passwordChecker(password);
    }
  }

  //Checking all indicators and then adding correct pass to stream
  void _passwordChecker(String password) {
    if (rangePassChecker(password, _rangeIndicatorController) &&
        registerPassChecker(password, _registerIndicatorController) &&
        minNumberPassChecker(password, _minNumIndicatorController) &&
        minSymbolPassChecker(password, _minSymbolIndicatorController) &&
        spacePassChecker(password, _spaceIndicatorController)) {
      _passwordController.sink.add(password);
    } else {
      _passwordController.sink.addError(_errorMsg);
    }
  }

  //Checking valid mail and then put to the stream
  void updateMail(String mail) {
    if (mail.contains("@")) {
      _mailController.sink.add(mail);
    } else {
      _mailController.sink.addError(_errorMsg);
    }
  }

  //Checking login
  void updateLogin(String login) {
    if (login.isNotEmpty) {
      _loginController.add(login);
    } else {
      _loginController.addError(_errorMsg);
    }
  }

  //Checking repeating password
  void updateRepeatPassword(String password) {
    if (_passwordController.value == password) {
      _repeatPasswordController.add(password);
    } else {
      _repeatPasswordController.addError(_errorMsg);
    }
  }

  //Merging all my streams to one, where i get only valid data
  Stream<bool> get validateForm => Rx.combineLatest4(
        mailStream,
        loginStream,
        passwordStream,
        repeatPasswordStream,
        (a, b, c, d) => true,
      );

  void _dispose() {
    _mailController.close();
    _loginController.close();
    _passwordController.close();
    _repeatPasswordController.close();

    _rangeIndicatorController.close();
    _registerIndicatorController.close();
    _minNumIndicatorController.close();
    _minSymbolIndicatorController.close();
    _spaceIndicatorController.close();
  }
}
