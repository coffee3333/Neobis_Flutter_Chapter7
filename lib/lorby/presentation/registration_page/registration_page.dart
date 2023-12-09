import 'package:flutter/material.dart';
import 'package:neobis_flutter_chapter7/lorby/dependencies/container/di_container.dart';
import 'package:neobis_flutter_chapter7/lorby/presentation/registration_page/registration_view.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return getIt.get<RegistrationView>();
  }
}
