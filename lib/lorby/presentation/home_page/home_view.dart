import 'package:flutter/material.dart';
import 'package:neobis_flutter_chapter7/lorby/core/consts/assets_consts.dart';
import 'package:neobis_flutter_chapter7/lorby/core/consts/routes_consts.dart';
import 'package:neobis_flutter_chapter7/lorby/core/consts/text_styles_consts.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBody(),
    );
  }

  _getBody() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 118, left: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "С возвращением!",
                style: TextStylesConsts.mainGraySryle,
              ),
              const SizedBox(height: 8),
              const Text(
                "Lorby - твой личный репетитор",
                style: TextStylesConsts.lv20GrayText,
              ),
              const SizedBox(height: 48),
              _getImage(),
              const SizedBox(height: 114),
              _getExitButton(),
            ],
          ),
        ),
      ),
    );
  }

  _getImage() {
    return Center(
      child: Image.asset(
        AssetsConsts.homePageImage,
      ),
    );
  }

  _getExitButton() {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.pushReplacementNamed(context, RoutesConsts.login);
        },
        child: const Text(
          "Выйти",
          style: TextStylesConsts.lv16GrayText,
        ),
      ),
    );
  }
}
