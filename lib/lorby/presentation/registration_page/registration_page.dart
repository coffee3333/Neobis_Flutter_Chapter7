import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neobis_flutter_chapter7/lorby/presentation/registration_page/cubit/register_cubit.dart';
import 'package:neobis_flutter_chapter7/lorby/presentation/registration_page/registration_view.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: const RegistrationView(),
    );
  }
}
