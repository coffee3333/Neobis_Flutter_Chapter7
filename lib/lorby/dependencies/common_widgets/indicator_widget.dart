import 'package:flutter/material.dart';
import 'package:neobis_flutter_chapter7/lorby/core/consts/text_styles_consts.dart';

class CustomIndicatorWidget extends StatelessWidget {
  final Stream? stream;
  final String header;
  const CustomIndicatorWidget(
      {super.key, required this.stream, required this.header});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.hasError) {
            return Text(
              " \u2022 $header ",
              style: TextStylesConsts.lv12GrayText,
            );
          }
          if (snapshot.data == true) {
            return Text(
              " \u2022 $header ✅",
              style: TextStylesConsts.lv12GreenText,
            );
          }
          if (snapshot.data == false) {
            return Text(
              " \u2022  $header ❌",
              style: TextStylesConsts.lv12RedText,
            );
          }
        }
        return Text(
          " \u2022 $header ",
          style: TextStylesConsts.lv12GrayText,
        );
      },
    );
  }
}
