import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum TextType { normal, bold, desc }

class GlobalText extends StatelessWidget {
  final String text;
  final TextType type;
  final double fontSize;
  final Color color;
  final TextAlign textAlign;

  const GlobalText({
    super.key,
    required this.text,
    this.type = TextType.normal,
    this.fontSize = 16.0,
    this.color = Colors.black,
    this.textAlign = TextAlign.left,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontFamily: 'Inter',
        fontSize: fontSize.sp,
        color: color,
        fontWeight: _getFontWeight(type),
      ),
    );
  }

  FontWeight _getFontWeight(TextType type) {
    switch (type) {
      case TextType.bold:
        return FontWeight.w700;
      case TextType.desc:
        return FontWeight.w300;
      case TextType.normal:
      default:
        return FontWeight.w400;
    }
  }
}
