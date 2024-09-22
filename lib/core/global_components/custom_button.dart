import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final double? fontSize;

  const GlobalButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,   // Use the custom width if provided, otherwise it defaults to null
      height: height, // Use the custom height if provided, otherwise it defaults to null
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: const Color(0xFF006FFD),
          padding: EdgeInsets.symmetric(vertical: height == null ? 16 : 0),
          textStyle: TextStyle(fontSize: fontSize ?? 16.sp), // Use custom font size if provided, otherwise default to 16
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        child: Center(child: Text(text)),
      ),
    );
  }
}
