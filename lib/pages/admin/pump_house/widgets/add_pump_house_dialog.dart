import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gerald/core/global_components/global_text.dart';

class AddPumpHouseDialog extends StatelessWidget {
  final TextEditingController nameController;
  final VoidCallback onAddPumpHouse;

  const AddPumpHouseDialog({
    super.key,
    required this.nameController,
    required this.onAddPumpHouse,
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
              text: "Add New Pump House",
              type: TextType.bold,
              fontSize: 20.sp,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.h),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(fontSize: 14.sp),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.blue,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        side: const BorderSide(color: Colors.blue),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                    ),
                    child: GlobalText(
                      text: "Cancel",
                      fontSize: 16.sp,
                      color: Colors.blue,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: ElevatedButton(
                    onPressed: onAddPumpHouse,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                    ),
                    child: GlobalText(
                      text: "Add",
                      fontSize: 16.sp,
                      color: Colors.white,
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
