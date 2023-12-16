import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neobis_flutter_chapter7/lorby/core/consts/assets_consts.dart';
import 'package:neobis_flutter_chapter7/lorby/core/consts/colors_consts.dart';
import 'package:neobis_flutter_chapter7/lorby/dependencies/common_widgets/common_widgets_extension.dart';

class CustomTextField extends StatelessWidget with CustomWidgetExtension {
  final Stream? stream;
  final String title;
  final Function(String) onChanged;
  final bool suffixShow;
  final bool? obscure;
  final Function()? obscureEvent;

  const CustomTextField({
    super.key,
    required this.stream,
    required this.title,
    required this.onChanged,
    required this.suffixShow,
    this.obscure,
    this.obscureEvent,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        return SizedBox(
          height: 52,
          child: TextField(
            obscureText: obscure ?? false,
            obscuringCharacter: "*",
            onChanged: (value) {
              onChanged(value);
            },
            decoration: _getCustomInputDecorator(
              title,
              suffixShow
                  ? IconButton(
                      onPressed: () {
                        obscureEvent!();
                      },
                      icon: obscure!
                          ? SvgPicture.asset(AssetsConsts.textFieldObscure)
                          : SvgPicture.asset(AssetsConsts.textFieldNotObscure),
                    )
                  : null,
              snapshot,
            ),
          ),
        );
      },
    );
  }

  InputDecoration _getCustomInputDecorator(String hintText,
      IconButton? iconButton, AsyncSnapshot<dynamic> snapshot) {
    return InputDecoration(
      hintText: hintText,
      filled: true,
      fillColor: ColorsConsts.bgGrayTextFormColor,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: _getFocusedBorder(snapshot),
      suffixIcon: iconButton,
    );
  }

  OutlineInputBorder _getFocusedBorder(AsyncSnapshot<dynamic> snapshot) {
    if (snapshot.hasData) {
      return OutlineInputBorder(
        borderSide: const BorderSide(
            color: ColorsConsts.greenIndicatorColor, width: 1.0),
        borderRadius: BorderRadius.circular(12),
      );
    }
    return OutlineInputBorder(
      borderSide:
          const BorderSide(color: ColorsConsts.lv2GrayTextColor, width: 1.0),
      borderRadius: BorderRadius.circular(12),
    );
  }
}
