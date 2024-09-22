import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gerald/core/global_components/global_text.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final String imagePath;
  final Color iconColor;

  const NotificationCard({
    super.key,
    required this.title,
    required this.description,
    required this.date,
    required this.imagePath,
    this.iconColor = Colors.amber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0.w), // Responsive padding
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8.0.w), // Responsive padding
            child: Image.asset(
              imagePath,
              width: 40.0.w, // Responsive width
              height: 40.0.h, // Responsive height
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12.0.w), // Responsive spacing
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GlobalText(
                  text: title,
                  type: TextType.bold,
                  fontSize: 12.0.sp, // Responsive font size
                ),
                SizedBox(height: 4.0.h), // Responsive spacing
                GlobalText(
                  text: description,
                  type: TextType.desc,
                  fontSize: 12.0.sp, // Responsive font size
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          SizedBox(width: 8.0.w), // Responsive spacing
          GlobalText(
            text: date,
            type: TextType.desc,
            fontSize: 12.0.sp, // Responsive font size
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}