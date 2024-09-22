import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gerald/core/global_components/global_text.dart';

class CustomDropdownField extends StatelessWidget {
  final String? label;
  final String? title; // Mengganti tittle dengan title
  final String value;
  final List<String> items;

  const CustomDropdownField({
    super.key,
    this.label,
    this.title, // Mengganti tittle dengan title
    required this.value,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) // Memeriksa apakah title ada
            Padding(
              padding: EdgeInsets.only(bottom: 4.0.h),
              child: GlobalText(
                text: title!,
                type: TextType.bold,
                fontSize: 12.sp,
              ),
            ),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: label,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            value: items.contains(value) ? value : items.first,
            items: items.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: (String? newValue) {
              // Handle change action
            },
          ),
        ],
      ),
    );
  }
}
