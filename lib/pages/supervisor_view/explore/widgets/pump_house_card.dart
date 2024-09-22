// Import file string yang baru
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gerald/core/constants/text.dart';
import 'package:gerald/core/global_components/global_text.dart';

class PumpHouseCard extends StatelessWidget {
  final String title;
  final String weather;
  final String waterLevel;
  final VoidCallback onTap; // Add onTap callback

  const PumpHouseCard({
    super.key,
    required this.title,
    required this.weather,
    required this.waterLevel,
    required this.onTap, // Make onTap required
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
        side: BorderSide(
          color: const Color(0xFFE0E0E0), // Light grey border
          width: 1.w,
        ),
      ),
      elevation: 0, // No shadow
      color: Colors.white, // White background
      child: InkWell(
        onTap: onTap, // Trigger the onTap callback when tapped
        child: Padding(
          padding: EdgeInsets.all(8.w),
          child: ListTile(
            title: GlobalText(
              text: title,
              type: TextType.bold,
              fontSize: 16.sp,
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 4.h),
                GlobalText(
                  text: SupervisorText.weather + ' : ' + weather, 
                  type: TextType.normal,
                  fontSize: 14.sp,
                  color: Colors.grey[600]!,
                ),
                GlobalText(
                  text: SupervisorText.waterLevel + ' : ' + waterLevel, 
                  type: TextType.normal,
                  fontSize: 14.sp,
                  color: Colors.grey[600]!,
                ),
              ],
            ),
            trailing: Icon(
              Icons.chevron_right,
              color: Colors.grey[600],
              size: 24.sp,
            ),
          ),
        ),
      ),
    );
  }
}
