import 'package:get_it/get_it.dart';
import 'package:neobis_flutter_chapter7/lorby/presentation/home_page/home_page.dart';
import 'package:neobis_flutter_chapter7/lorby/presentation/home_page/home_view.dart';
import 'package:neobis_flutter_chapter7/lorby/presentation/login_page/login_page.dart';
import 'package:neobis_flutter_chapter7/lorby/presentation/login_page/login_view.dart';
import 'package:neobis_flutter_chapter7/lorby/presentation/registration_page/registration_page.dart';
import 'package:neobis_flutter_chapter7/lorby/presentation/registration_page/registration_view.dart';

final getIt = GetIt.instance;

void setupDi() {
  getIt.registerSingleton<HomeView>(const HomeView());
  getIt.registerSingleton<LoginView>(const LoginView());
  getIt.registerSingleton<RegistrationView>(const RegistrationView());
  getIt.registerSingleton<HomePage>(const HomePage());
  getIt.registerSingleton<LoginPage>(const LoginPage());
  getIt.registerSingleton<RegistrationPage>(const RegistrationPage());
}
