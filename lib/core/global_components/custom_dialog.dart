import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gerald/core/global_components/global_text.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String message;
  final String leftButtonText;
  final String rightButtonText;
  final VoidCallback onLeftButtonPressed;
  final VoidCallback onRightButtonPressed;
  final Color leftButtonColor;
  final Color rightButtonColor;
  final Color leftButtonTextColor;
  final Color rightButtonTextColor;

  const CustomDialog({
    super.key,
    required this.title,
    required this.message,
    this.leftButtonText = 'Cancel',
    this.rightButtonText = 'OK',
    required this.onLeftButtonPressed,
    required this.onRightButtonPressed,
    this.leftButtonColor = Colors.white,
    this.rightButtonColor = Colors.blue,
    this.leftButtonTextColor = Colors.blue,
    this.rightButtonTextColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GlobalText(
              text: title,
              type: TextType.bold,
              fontSize: 16,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.h),
            GlobalText(
              text: message,
              type: TextType.normal,
              fontSize: 12,
              color: Colors.black,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: onLeftButtonPressed,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: leftButtonTextColor, backgroundColor: leftButtonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        side: BorderSide(color: leftButtonTextColor),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                    ),
                    child: GlobalText(
                      text: leftButtonText,
                      fontSize: 16,
                      color: leftButtonTextColor,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(width: 10.w), // Add space between buttons
                Expanded(
                  child: ElevatedButton(
                    onPressed: onRightButtonPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: rightButtonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                    ),
                    child: GlobalText(
                      text: rightButtonText,
                      fontSize: 16,
                      color: rightButtonTextColor,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}