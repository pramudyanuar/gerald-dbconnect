import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:gerald/core/constants/images.dart';
import 'package:gerald/core/constants/text.dart';
import 'package:gerald/core/global_components/base_appbar.dart';
import 'package:gerald/core/global_components/base_widget_container.dart';
import 'package:gerald/core/global_components/custom_backbutton.dart';
import 'package:gerald/core/global_components/global_text.dart';
import 'package:gerald/core/utils/routes_screen.dart';
import 'package:get/get.dart';

class PumpHouseScreen extends StatelessWidget {
  PumpHouseScreen({super.key});

  // Method to load pump house data from SharedPreferences
  Future<Map<String, dynamic>> _loadPumpHouseData() async {
    final prefs = await SharedPreferences.getInstance();
    String? pumpHouseDetailJson = prefs.getString('pumpHouseDetail');
    
    if (pumpHouseDetailJson != null) {
      return jsonDecode(pumpHouseDetailJson);
    } else {
      throw 'Pump house data not found in local storage.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidgetContainer(
      appBar: BaseAppBar.baseAppBar(
        context,
        leading: CustomBackButton(
          onPressed: () {
            Get.offAllNamed(NavigationRoute.mainMenu);
          },
        ),
        title: GlobalText(
          text: OfficerText.pumphouse,
          type: TextType.bold,
          fontSize: 18.sp,
        ),
        action: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.blue),
            onPressed: () {
              Get.offAllNamed(NavigationRoute.editpump);
            },
          ),
        ],
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _loadPumpHouseData(), // Load pump house data from SharedPreferences
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator()); // Show loading indicator while loading
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}')); // Show error if any
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No pump house data available.'));
          }

          // Extract pump data from snapshot
          final pumpData = snapshot.data!;

          return Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: Image.asset(
                    Images.pumphouse,
                    height: 343.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 16.h),
                GlobalText(
                  text: pumpData['nama_rumah'] ?? 'Unknown',
                  type: TextType.bold,
                  fontSize: 20.sp,
                ),
                SizedBox(height: 8.h),
                GlobalText(
                  text: pumpData['alamat'] ?? 'Unknown Address',
                  type: TextType.normal,
                  fontSize: 14.sp,
                  color: Colors.grey,
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    GlobalText(
                      text: (pumpData['threshold']?.toString() ?? '0') + ' cm',
                      type: TextType.bold,
                      fontSize: 20.sp,
                    ),
                    SizedBox(width: 8.w),
                    GlobalText(
                      text: OfficerText.tresshold,
                      type: TextType.normal,
                      fontSize: 14.sp,
                      color: Colors.grey,
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    GlobalText(
                      text: (pumpData['ketinggian_sensor']?.toString() ?? '0') + ' cm',
                      type: TextType.bold,
                      fontSize: 20.sp,
                    ),
                    SizedBox(width: 8.w),
                    GlobalText(
                      text: OfficerText.waterlevel,
                      type: TextType.normal,
                      fontSize: 14.sp,
                      color: Colors.grey,
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                if (pumpData['pompa'] != null && pumpData['pompa'].isNotEmpty) ...[
                  Row(
                    children: [
                      GlobalText(
                        text: '${pumpData['pompa'][0]['jumlah_pompa_hidup'] ?? '0'} / ${pumpData['pompa'][0]['jumlah_total_pompa'] ?? '0'}',
                        type: TextType.bold,
                        fontSize: 20.sp,
                      ),
                      SizedBox(width: 8.w),
                      GlobalText(
                        text: OfficerText.pumpstatusdesc,
                        type: TextType.normal,
                        fontSize: 14.sp,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}
