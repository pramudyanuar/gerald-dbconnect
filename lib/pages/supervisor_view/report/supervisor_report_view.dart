import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gerald/core/global_components/base_widget_container.dart';
import 'package:gerald/core/global_components/global_text.dart';
import 'package:gerald/pages/supervisor_view/report/potensi_banjir_screen.dart';
import 'package:gerald/pages/supervisor_view/report/rumah_pompa_screen.dart';

class SupervisorReportView extends StatelessWidget {
  const SupervisorReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: BaseWidgetContainer(
        body: Column(
          children: [
            SizedBox(
              height: 76.h,
              child: TabBar(
                tabs: const [
                  Tab(
                    child: GlobalText(
                      text: "Potensi Banjir",
                      type: TextType.bold,
                    ),
                  ),
                  Tab(
                    child: GlobalText(
                      text: "Rumah Pompa",
                      type: TextType.bold,
                    ),
                  ),
                ],
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(width: 6.w, color: Colors.blue),
                  insets: EdgeInsets.symmetric(horizontal: 30.h),
                ),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                dividerColor: Colors.transparent
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  LaporanPotensiBanjirScreen(),
                  LaporanRumahPompaScreen()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
