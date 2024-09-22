import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gerald/core/global_components/base_widget_container.dart';
import 'package:gerald/core/global_components/global_text.dart';
import 'package:gerald/pages/supervisor_view/report/widgets/flood_chart.dart';
import 'package:gerald/pages/supervisor_view/report/widgets/monthly_report.dart';

class LaporanPotensiBanjirScreen extends StatelessWidget {
  const LaporanPotensiBanjirScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Contoh data statis, nanti akan digantikan dengan data dinamis dari API
    final List<double> floodData = [24, 16, 4, 2, 2, 4];
    final List<String> months = ["Des", "Jan", "Feb", "Mar", "Apr", "Mei"];

    return BaseWidgetContainer(
      body: Padding(
        padding: EdgeInsets.all(16.h.w),
        child: Column(
          children: [
            Container(
              height: 300.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: const Color(0xFFE0E0E0),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const GlobalText(
                      text: "Potensi Banjir",
                      type: TextType.bold,
                      fontSize: 15,
                    ),
                    SizedBox(height: 10.h),
                    Expanded(
                      child: FloodPotentialBarChart(
                        data: floodData,
                        months: months,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: MonthlyReport(),
            ),
          ],
        ),
      ),
    );
  }
}
