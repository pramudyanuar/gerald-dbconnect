import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gerald/core/global_components/base_widget_container.dart';
import 'package:gerald/core/global_components/global_text.dart';
import 'package:gerald/core/utils/routes_screen.dart';
import 'package:get/get.dart';

class LaporanRumahPompaScreen extends StatelessWidget {
  LaporanRumahPompaScreen({super.key});
  final List<Map<String, dynamic>> notifications = [
    {
      'title': 'Rumah Pompa Mulyosari',
      'count': 5,
    },
    {
      'title': 'Rumah Pompa Kenjeran',
      'count': 2,
    },
    {
      'title': 'Rumah Pompa Ngagel',
      'count': 10,
    },
    {
      'title': 'Rumah Pompa Wonorejo',
      'count': 3,
    },
    {
      'title': 'Rumah Pompa Gunung Anyar',
      'count': 1,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return BaseWidgetContainer(
      body: Padding(
        padding: EdgeInsets.all(12.h.w),
        child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: GlobalText(
                text: notifications[index]['title'],
                type: TextType.normal,
              ),
              trailing: CircleAvatar(
                radius: 12,
                backgroundColor: Colors.blue,
                child: GlobalText(
                  text: notifications[index]['count'].toString(),
                  type: TextType.normal,
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
              onTap: () {
                Get.offAllNamed(NavigationRoute.reportlist);
              },
            );
          },
        ),
      ),
    );
  }
}
