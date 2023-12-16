import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neobis_flutter_chapter7/lorby/core/consts/assets_consts.dart';
import 'package:neobis_flutter_chapter7/lorby/core/consts/colors_consts.dart';
import 'package:neobis_flutter_chapter7/lorby/core/consts/routes_consts.dart';
import 'package:neobis_flutter_chapter7/lorby/core/consts/text_styles_consts.dart';
import 'package:neobis_flutter_chapter7/lorby/dependencies/common_widgets/common_loading_widget.dart';
import 'package:neobis_flutter_chapter7/lorby/dependencies/common_widgets/common_widgets_extension.dart';
import 'package:neobis_flutter_chapter7/lorby/presentation/login_page/cubit/login_cubit.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with CustomWidgetExtension {
  bool showPass = true;
  final _loginFormKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBody(),
    );
  }

  _getBody() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _getLoginImage(),
              const SizedBox(height: 32),
              _getLoginText(),
              const SizedBox(height: 28),
              _getLoginForm(),
              const SizedBox(height: 28),
              _getRegisterLink(),
            ],
          ),
        ),
      ),
    );
  }

  _getLoginImage() {
    return Center(
      child: SvgPicture.asset(
        AssetsConsts.loginLogo,
      ),
    );
  }

  _getLoginText() {
    return const Text(
      "Вэлком бэк!",
      style: TextStylesConsts.mainGraySryle,
      textAlign: TextAlign.center,
    );
  }

  _getLoginForm() {
    return Form(
      key: _loginFormKey,
      child: Column(
        children: [
          _getLoginTextForm(),
          const SizedBox(
            height: 14,
          ),
          _getPassTextForm(),
          const SizedBox(
            height: 24,
          ),
          _getLoginButton(),
        ],
      ),
    );
  }

  _getLoginTextForm() {
    return SizedBox(
      // height: 52,
      child: TextFormField(
        controller: _usernameController,
        style: TextStylesConsts.lv16GrayText,
        decoration: getCustomInputDecorator("Введи туда-сюда логин", null),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Введи логин";
          }
          return null;
        },
      ),
    );
  }

  _getPassTextForm() {
    return SizedBox(
      // height: 52,
      child: TextFormField(
        controller: _passwordController,
        obscureText: showPass,
        obscuringCharacter: "*",
        style: TextStylesConsts.lv16GrayText,
        decoration: getCustomInputDecorator(
          "Пароль (тоже введи)",
          IconButton(
            onPressed: () {
              setState(() {
                showPass = !showPass;
              });
            },
            icon: showPass
                ? SvgPicture.asset(AssetsConsts.textFieldObscure)
                : SvgPicture.asset(AssetsConsts.textFieldNotObscure),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Введи пароль";
          }
          return null;
        },
      ),
    );
  }

  Widget _getRegisterLink() {
    return Padding(
      padding: const EdgeInsets.only(top: 13),
      child: GestureDetector(
        onTap: () {
          _usernameController.clear();
          _passwordController.clear();
          Navigator.pushNamed(context, RoutesConsts.registration);
        },
        child: const Text(
          "У меня еще нет аккаунта",
          style: TextStylesConsts.lv16GrayText,
        ),
      ),
    );
  }

  Widget _getLoginButton() {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginDone) {
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, RoutesConsts.home);
        }
        if (state is LoginError) {
          Navigator.pop(context);
          _buildErrorDialog(context, state.errorMessages);
        }
        if (state is LoginIsLoading) {
          _buildLoading();
        }
      },
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorsConsts.lv2GrayTextColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          onPressed: () {
            if (_loginFormKey.currentState!.validate()) {
              context.read<LoginCubit>().loginEvent(
                  _usernameController.text, _passwordController.text);
            }
          },
          child: const Text(
            'Войти',
            style: TextStylesConsts.lv16WhiteText,
          ),
        ),
      ),
    );
  }

  void _buildLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CommonLoadingDialog();
      },
    );
  }

  Column _errorMessages(List<String> errors) {
    List<Widget> widgets = [];
    for (var error in errors) {
      widgets.add(
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsetsDirectional.symmetric(
              vertical: 15, horizontal: 16),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: 1, color: ColorsConsts.redIndicatorColor),
          ),
          child: Text(
            error,
            style: TextStylesConsts.lv16RedText,
            overflow: TextOverflow.visible,
          ),
        ),
      );
    }
    return Column(
      children: widgets,
    );
  }

  void _buildErrorDialog(BuildContext context, List<String> errors) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: _errorMessages(errors),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.transparent,
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.only(top: 0),
      ),
    );
  }
}
