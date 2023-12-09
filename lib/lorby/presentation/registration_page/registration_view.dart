import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neobis_flutter_chapter7/lorby/core/consts/assets_consts.dart';
import 'package:neobis_flutter_chapter7/lorby/core/consts/colors_consts.dart';
import 'package:neobis_flutter_chapter7/lorby/core/consts/text_styles_consts.dart';
import 'package:neobis_flutter_chapter7/lorby/presentation/common_widgets/common_widgets_extension.dart';

class RegistrationView extends StatefulWidget {
  const RegistrationView({super.key});

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView>
    with CustomWidgetExtension {
  bool _showPass = true;
  bool _showConfirmPass = true;
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _passConfirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      body: _getBody(),
    );
  }

  _getAppBar() {
    return AppBar(
      title: const Text(
        "Регистрация",
        style: TextStylesConsts.lv16GrayText,
      ),
    );
  }

  _getBody() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _getTitleRegister(),
              const SizedBox(
                height: 40,
              ),
              _getRegisterForm(),
            ],
          ),
        ),
      ),
    );
  }

  _getTitleRegister() {
    return const Column(
      children: [
        Text(
          "Создать аккаун",
          style: TextStylesConsts.mainGraySryle,
        ),
        Text(
          "Lorby",
          style: TextStylesConsts.mainGraySryle,
        ),
      ],
    );
  }

  _getRegisterForm() {
    return Form(
      // key: _registerFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getMailTextForm(),
          const SizedBox(
            height: 14,
          ),
          _getLoginTextForm(),
          const SizedBox(
            height: 14,
          ),
          _getPassTextForm(),
          const SizedBox(
            height: 14,
          ),
          _getPassIndicators(),
          const SizedBox(
            height: 14,
          ),
          _getPassConfirmTextForm(),
          const SizedBox(
            height: 24,
          ),
          _getLoginButton(),
        ],
      ),
    );
  }

  _getMailTextForm() {
    return SizedBox(
      height: 52,
      child: TextFormField(
        controller: _mailController,
        style: TextStylesConsts.lv16GrayText,
        decoration: getCustomInputDecorator("Введи адрес почты", null),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Введи адрес почты';
          }
          return null;
        },
      ),
    );
  }

  _getLoginTextForm() {
    return SizedBox(
      height: 52,
      child: TextFormField(
        controller: _loginController,
        style: TextStylesConsts.lv16GrayText,
        decoration: getCustomInputDecorator("Придумай логин", null),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Придумай логин';
          }
          return null;
        },
      ),
    );
  }

  _getPassTextForm() {
    return SizedBox(
      height: 52,
      child: TextFormField(
        controller: _passController,
        obscureText: _showPass,
        obscuringCharacter: "*",
        style: TextStylesConsts.lv16GrayText,
        decoration: getCustomInputDecorator(
          "Создай пароль",
          IconButton(
            onPressed: () {
              setState(
                () {
                  _showPass = !_showPass;
                },
              );
            },
            icon: _showPass
                ? SvgPicture.asset(AssetsConsts.textFieldObscure)
                : SvgPicture.asset(AssetsConsts.textFieldNotObscure),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Создай пароль';
          }
          return null;
        },
      ),
    );
  }

  _getPassIndicators() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          " \u2022 От 8 до 15 символов",
          style: TextStylesConsts.lv12GrayText,
        ),
        Text(
          " \u2022 Строчные и прописные буквы",
          style: TextStylesConsts.lv12GrayText,
        ),
        Text(
          " \u2022 Минимум 1 цифра",
          style: TextStylesConsts.lv12GrayText,
        ),
        Text(
          " \u2022 Минимум 1 спецсимвол (!, \", \#, \$...)",
          style: TextStylesConsts.lv12GrayText,
        ),
      ],
    );
  }

  _getPassConfirmTextForm() {
    return SizedBox(
      height: 52,
      child: TextFormField(
        controller: _passConfirmController,
        obscureText: _showConfirmPass,
        obscuringCharacter: "*",
        style: TextStylesConsts.lv16GrayText,
        decoration: getCustomInputDecorator(
          "Повтори пароль",
          IconButton(
            onPressed: () {
              setState(
                () {
                  _showConfirmPass = !_showConfirmPass;
                },
              );
            },
            icon: _showConfirmPass
                ? SvgPicture.asset(AssetsConsts.textFieldObscure)
                : SvgPicture.asset(AssetsConsts.textFieldNotObscure),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Повтори пароль';
          }
          return null;
        },
      ),
    );
  }

  _getLoginButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorsConsts.lv2GrayTextColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0), // Set border radius
          ),
        ),
        onPressed: () {},
        child: const Text(
          'Далее',
          style: TextStylesConsts.lv16WhiteText,
        ),
      ),
    );
  }
}
