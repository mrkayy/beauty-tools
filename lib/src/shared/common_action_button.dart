import 'package:flutter/material.dart';

class CommonActionButton extends StatelessWidget {
  const CommonActionButton({
    @required this.txt,
    @required this.btnColor,
    @required this.txtColor,
    @required this.action,
    this.borderRadius,
    this.fontSize,
  });

  final String txt;
  final Color txtColor;
  final Color btnColor;
  final Function action;
  final double fontSize;
  final BorderRadiusGeometry borderRadius;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialButton(
      elevation: 1.0,
      shape: borderRadius != null
          ? RoundedRectangleBorder(borderRadius: borderRadius)
          : null,
      height: 55.0,
      minWidth: 220.0,
      color: btnColor,
      onPressed: action,
      child: Text(
        txt,
        style: textTheme.headline6.copyWith(
            color: txtColor, fontSize: fontSize != null ? fontSize : null),
      ),
    );
  }
}
