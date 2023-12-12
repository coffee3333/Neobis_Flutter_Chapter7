import 'package:flutter/material.dart';
import 'package:neobis_flutter_chapter7/lorby/core/consts/colors_consts.dart';

mixin CustomWidgetExtension {
  InputDecoration getCustomInputDecorator(
      String hintText, IconButton? iconButton) {
    return InputDecoration(
      hintText: hintText,
      filled: true,
      fillColor: ColorsConsts.bgGrayTextFormColor,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide:
            const BorderSide(color: ColorsConsts.lv2GrayTextColor, width: 1.0),
        borderRadius: BorderRadius.circular(12),
      ),
      suffixIcon: iconButton,
    );
  }
}
