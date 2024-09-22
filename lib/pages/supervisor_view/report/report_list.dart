import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gerald/core/global_components/base_appbar.dart';
import 'package:gerald/core/global_components/base_widget_container.dart';
import 'package:gerald/core/global_components/custom_backbutton.dart';
import 'package:gerald/core/global_components/global_text.dart';
import 'package:gerald/core/utils/routes_screen.dart';
import 'package:get/get.dart';

class ReportListScreen extends StatelessWidget {
  ReportListScreen({super.key});

  final List<Map<String, dynamic>> notifications = [
    {
      'title': 'Laporan saluran tersumbat sampah',
      'time': '16.00',
    },
    {
      'title': 'Laporan pompa rusak',
      'time': '15.00',
    },
    {
      'title': 'Laporan banjir di Jalan Semolowaru',
      'time': '14.00',
    },
    {
      'title': 'Laporan banjir di Jalan Raya Darmo',
      'time': '13.00',
    },
    {
      'title': 'Laporan banjir di Jalan Raya Manyar',
      'time': '12.00',
    },
    {
      'title': 'Laporan banjir di Jalan Raya Dukuh Kupang',
      'time': '11.00',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return BaseWidgetContainer(
      appBar: BaseAppBar.baseAppBar(
        context,
        title: const GlobalText(
          text: "Rumah Pompa Mulyosari (Ring road ITS)",
          type: TextType.bold,
          fontSize: 18,
        ),
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        leading: CustomBackButton(
          onPressed: () => {
            Get.offAllNamed(NavigationRoute.mainMenu, arguments: {"index": 1, "role": "Supervisor"}),
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      title: GlobalText(
                        text: notifications[index]['title'],
                        type: TextType.normal,
                        fontSize: 16.sp,
                      ),
                      trailing: GlobalText(
                        text: notifications[index]['time'],
                        type: TextType.normal,
                        fontSize: 14.sp,
                      ),
                      onTap: () {
                        // Navigate to detail report screen when tapped
                        Get.offAllNamed(NavigationRoute.detailreport);
                      },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
