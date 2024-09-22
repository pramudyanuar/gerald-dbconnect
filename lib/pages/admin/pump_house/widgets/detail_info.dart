import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gerald/core/constants/text.dart';
import 'package:gerald/core/global_components/global_text.dart';

class DetailInfoCard extends StatelessWidget {
  final String weather;
  final String waterLevel;
  final String rainProbability;
  final String pumpStatus;
  final String waterLevelLimit;
  final String sensorHeight;
  final String floodPotential;

  const DetailInfoCard({
    super.key,
    required this.weather,
    required this.waterLevel,
    required this.rainProbability,
    required this.pumpStatus,
    required this.waterLevelLimit,
    required this.sensorHeight,
    required this.floodPotential,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 10.h),
          Center(
            child: GlobalText(
              text: SupervisorText.detailInfoTitle,
              fontSize: 16.sp,
              type: TextType.bold,
            ),
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GlobalText(
                        text: weather,
                        fontSize: 14.sp,
                        type: TextType.bold,
                      ),
                      GlobalText(
                        text: SupervisorText.weather,
                        fontSize: 12.sp,
                        type: TextType.desc,
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GlobalText(
                        text: rainProbability,
                        fontSize: 14.sp,
                        type: TextType.bold,
                      ),
                      GlobalText(
                        text: SupervisorText.rainProbability,
                        fontSize: 12.sp,
                        type: TextType.desc,
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GlobalText(
                        text: waterLevelLimit,
                        fontSize: 14.sp,
                        type: TextType.bold,
                      ),
                      GlobalText(
                        text: SupervisorText.waterLevelLimit,
                        fontSize: 12.sp,
                        type: TextType.desc,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GlobalText(
                        text: waterLevel,
                        fontSize: 14.sp,
                        type: TextType.bold,
                      ),
                      GlobalText(
                        text: SupervisorText.waterLevel,
                        fontSize: 12.sp,
                        type: TextType.desc,
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GlobalText(
                        text: pumpStatus,
                        fontSize: 14.sp,
                        type: TextType.bold,
                      ),
                      GlobalText(
                        text: SupervisorText.pumpStatus,
                        fontSize: 12.sp,
                        type: TextType.desc,
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GlobalText(
                        text: sensorHeight,
                        fontSize: 14.sp,
                        type: TextType.bold,
                      ),
                      GlobalText(
                        text: SupervisorText.sensorHeight,
                        fontSize: 12.sp,
                        type: TextType.desc,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.info,
                color: Colors.blue,
                size: 24.sp, // Adjust icon size
              ),
              SizedBox(width: 8.w),
              GlobalText(
                text: floodPotential,
                fontSize: 12.sp,
                color: Colors.blue,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }
}