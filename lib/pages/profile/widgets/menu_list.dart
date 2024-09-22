import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gerald/core/global_components/global_text.dart';

class ProfileMenuItem extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const ProfileMenuItem({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Theme.of(context).primaryColor.withOpacity(0.2), 
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GlobalText(
                  text: text,
                  type: TextType.normal,
                  fontSize: 14.sp,
                ),
                Icon(Icons.arrow_forward_ios, size: 18.sp),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
