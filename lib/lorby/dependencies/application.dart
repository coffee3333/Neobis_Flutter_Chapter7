import 'package:flutter/material.dart';
import 'package:neobis_flutter_chapter7/lorby/core/consts/colors_consts.dart';
import 'package:neobis_flutter_chapter7/lorby/core/consts/routes_consts.dart';
import 'package:neobis_flutter_chapter7/lorby/dependencies/container/di_container.dart';
import 'package:neobis_flutter_chapter7/lorby/presentation/home_page/home_page.dart';
import 'package:neobis_flutter_chapter7/lorby/presentation/login_page/login_page.dart';
import 'package:neobis_flutter_chapter7/lorby/presentation/registration_page/registration_page.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: ColorsConsts.mainBgColor),
      debugShowCheckedModeBanner: false,
      routes: {
        RoutesConsts.home: (context) => getIt.get<HomePage>(),
        RoutesConsts.login: (context) => getIt.get<LoginPage>(),
        RoutesConsts.registration: (context) => getIt.get<RegistrationPage>(),
      },
      initialRoute: RoutesConsts.login,
    );
  }
}
