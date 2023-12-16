import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neobis_flutter_chapter7/lorby/core/consts/colors_consts.dart';
import 'package:neobis_flutter_chapter7/lorby/core/consts/routes_consts.dart';
import 'package:neobis_flutter_chapter7/lorby/core/consts/strings_consts.dart';
import 'package:neobis_flutter_chapter7/lorby/core/consts/text_styles_consts.dart';
import 'package:neobis_flutter_chapter7/lorby/dependencies/common_widgets/common_indicator_widget.dart';
import 'package:neobis_flutter_chapter7/lorby/dependencies/common_widgets/common_loading_widget.dart';
import 'package:neobis_flutter_chapter7/lorby/dependencies/common_widgets/common_text_field_widget.dart';
import 'package:neobis_flutter_chapter7/lorby/presentation/registration_page/cubit/register_cubit.dart';

class RegistrationView extends StatefulWidget {
  const RegistrationView({super.key});

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  RegisterCubit? _registerScreenCubit;

  bool showPass = true;
  bool showConfirmPass = true;

  @override
  Widget build(BuildContext context) {
    _registerScreenCubit = BlocProvider.of<RegisterCubit>(
      context,
      listen: false,
    );
    return Scaffold(
      appBar: _getAppBar(),
      body: _getBody(),
    );
  }

  AppBar _getAppBar() {
    return AppBar(
      title: const Text(
        "Регистрация",
        style: TextStylesConsts.lv16GrayText,
      ),
    );
  }

  Widget _getBody() {
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

  Column _getTitleRegister() {
    return const Column(
      children: [
        Text(
          "Создать аккаунт",
          style: TextStylesConsts.mainGraySryle,
        ),
        Text(
          "Lorby",
          style: TextStylesConsts.mainGraySryle,
        ),
      ],
    );
  }

  Column _getRegisterForm() {
    return Column(
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
    );
  }

  Widget _getMailTextForm() {
    return CustomTextField(
        stream: _registerScreenCubit?.mailStream,
        title: "Введи адрес почты",
        onChanged: (value) {
          _registerScreenCubit?.updateMail(value);
        },
        suffixShow: false);
  }

  Widget _getLoginTextForm() {
    return CustomTextField(
        stream: _registerScreenCubit?.loginStream,
        title: "Придумай логин",
        onChanged: (value) {
          _registerScreenCubit?.updateLogin(value);
        },
        suffixShow: false);
  }

  Widget _getPassTextForm() {
    return CustomTextField(
      stream: _registerScreenCubit?.passwordStream,
      title: "Создай пароль",
      onChanged: (value) {
        _registerScreenCubit?.updatePassword(value);
      },
      suffixShow: true,
      obscure: showPass,
      obscureEvent: () {
        setState(
          () {
            showPass = !showPass;
          },
        );
      },
    );
  }

  Column _getPassIndicators() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _getRangeIndicator(),
        _getRegisterIndicator(),
        _getMinNumberIndicator(),
        _getMinSymbolIndicator(),
        _getSpaceIndicator(),
      ],
    );
  }

  Widget _getRangeIndicator() {
    return CustomIndicatorWidget(
        stream: _registerScreenCubit?.rangeIndicator,
        header: StringConsts.rangeIndicatorString);
  }

  Widget _getRegisterIndicator() {
    return CustomIndicatorWidget(
        stream: _registerScreenCubit?.registerIndicator,
        header: StringConsts.registerIndocatorString);
  }

  Widget _getMinNumberIndicator() {
    return CustomIndicatorWidget(
        stream: _registerScreenCubit?.minNumIndicator,
        header: StringConsts.minNumIndiactorString);
  }

  Widget _getMinSymbolIndicator() {
    return CustomIndicatorWidget(
        stream: _registerScreenCubit?.minSymbolIndicator,
        header: StringConsts.minSymbolIndiactorString);
  }

  Widget _getSpaceIndicator() {
    return CustomIndicatorWidget(
        stream: _registerScreenCubit?.spaceIndicator,
        header: StringConsts.spaceIndiactorString);
  }

  Widget _getPassConfirmTextForm() {
    return CustomTextField(
      stream: _registerScreenCubit?.repeatPasswordStream,
      title: "Повтори пароль",
      onChanged: (value) {
        _registerScreenCubit?.updateRepeatPassword(value);
      },
      suffixShow: true,
      obscure: showConfirmPass,
      obscureEvent: () {
        setState(
          () {
            showConfirmPass = !showConfirmPass;
          },
        );
      },
    );
  }

  Widget _getLoginButton() {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegistrationDone) {
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, RoutesConsts.home);
        }
        if (state is RegistartionError) {
          Navigator.pop(context);
          _buildErrorDialog(context, state.errorMessages);
        }
        if (state is RegistartionIsLoading) {
          _buildLoading();
        }
      },
      child: StreamBuilder(
        stream: _registerScreenCubit?.validateForm,
        builder: (context, snapshot) {
          return SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorsConsts.lv2GrayTextColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              onPressed: snapshot.hasData
                  ? () => context.read<RegisterCubit>().registerEvent()
                  : null,
              child: Text(
                'Далее',
                style: snapshot.hasData
                    ? TextStylesConsts.lv16WhiteText
                    : TextStylesConsts.lv16GrayText,
              ),
            ),
          );
        },
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
