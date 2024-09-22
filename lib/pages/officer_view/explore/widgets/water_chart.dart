import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:gerald/core/global_components/global_text.dart';

class WaterLevelChart extends StatelessWidget {
  final List<FlSpot> dataPoints;
  final List<String> bottomLabels;

  const WaterLevelChart({
    super.key,
    required this.dataPoints,
    required this.bottomLabels,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 343.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: const Color(0xFFE0E0E0),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const GlobalText(
              text: "History Ketinggian Air",
              type: TextType.bold,
              fontSize: 15,
            ),
            SizedBox(height: 15.h), // Space between text and chart
            Expanded(
              child: LineChart(
                LineChartData(
                  gridData: const FlGridData(show: true, drawVerticalLine: true),
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 22,
                        interval: 1, // Ensure spacing between labels
                        getTitlesWidget: (value, meta) {
                          if (value.toInt() >= 0 && value.toInt() < bottomLabels.length) {
                            return Text(
                              bottomLabels[value.toInt()],
                              style: TextStyle(fontSize: 10.sp),
                            );
                          }
                          return const Text('');
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 32,
                        getTitlesWidget: (value, meta) {
                          return Text('${value.toInt()}cm',
                              style: TextStyle(fontSize: 10.sp));
                        },
                      ),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false), // Hide right titles
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false), // Hide top titles
                    ),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(color: const Color(0xFFE0E0E0)),
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      spots: dataPoints,
                      isCurved: false, // Make the line straight
                      barWidth: 3,
                      isStrokeCapRound: true,
                      dotData: const FlDotData(show: true),
                      belowBarData: BarAreaData(show: false), // Optional: show shaded area below the line
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}