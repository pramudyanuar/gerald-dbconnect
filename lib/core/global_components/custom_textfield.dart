import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gerald/core/global_components/global_text.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final String placeholder;
  final TextEditingController? controller;
  final String? title;
  final bool obscureText;
  final Widget? suffixIcon;
  final ValueChanged<String>? onChanged;
  final TextStyle? textStyle;
  final InputDecoration? decoration;
  final TextStyle? hintStyle;
  final String? initialText;

  CustomTextField({
    super.key,
    this.label,
    required this.placeholder,
    TextEditingController? controller,
    this.title,
    this.obscureText = false,
    this.suffixIcon,
    this.onChanged,
    this.textStyle,
    this.decoration,
    this.hintStyle,
    this.initialText,
  }) : controller = controller ?? TextEditingController(text: initialText);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Padding(
              padding: EdgeInsets.only(bottom: 4.0.h, left: 4.0.w),
              child: GlobalText(
                text: title!,
                type: TextType.bold,
                fontSize: 12.sp,
              ),
            ),
          TextField(
            controller: controller,
            obscureText: obscureText,
            style: textStyle ?? TextStyle(fontSize: 14.sp),
            decoration: decoration?.copyWith(
                  hintText: placeholder,
                  hintStyle: hintStyle ?? TextStyle(color: Colors.grey[400]),
                  suffixIcon: suffixIcon,
                ) ??
                InputDecoration(
                  labelText: label,
                  hintText: placeholder,
                  hintStyle: hintStyle ?? TextStyle(color: Colors.grey[400]),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  suffixIcon: suffixIcon,
                ),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
