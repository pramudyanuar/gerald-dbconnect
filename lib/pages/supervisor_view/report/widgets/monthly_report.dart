import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gerald/core/constants/text.dart';
import 'package:gerald/core/global_components/global_text.dart';
import 'package:gerald/pages/supervisor_view/report/widgets/download_report_card.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

class MonthlyReport extends StatelessWidget {
  MonthlyReport({Key? key}) : super(key: key);

  final List<Map<String, String>> reports = [
    {'month': 'september', 'year': '2024'},
    {'month': 'Mei', 'year': '2024'},
    {'month': 'April', 'year': '2024'},
    // Tambahkan lebih banyak laporan di sini jika diperlukan
  ];

  Future<void> _downloadReport(String month) async {
    final url = 'http://10.0.2.2:8000/api/pengawas/laporan/recap/$month';

    try {
      // Ambil bearer token dari shared preferences
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('bearer_token') ?? '';

      if (token.isEmpty) {
        print('Bearer token tidak ditemukan');
        return;
      }

      // Dapatkan path ke direktori Download
      final dir = await getExternalStorageDirectory();
      if (dir == null) {
        print('Tidak dapat mengakses direktori unduhan');
        return;
      }

      final downloadPath = Directory('${dir.path}/Download');
      if (!(await downloadPath.exists())) {
        await downloadPath.create(recursive: true);
      }
      
      final filePath = '${downloadPath.path}/laporan_$month.xlsx';

      // Inisialisasi Dio untuk permintaan HTTP
      final dio = Dio();

      // Atur header dengan authorization
      final options = Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      // Unduh file dan simpan di direktori Download
      await dio.download(url, filePath, options: options);

      print('Unduhan selesai. File disimpan di $filePath');
      
      // Anda dapat menambahkan kode untuk membuka file di sini jika diperlukan
    } catch (e) {
      print('Kesalahan saat mengunduh laporan: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: const Color(0xFFE0E0E0),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const GlobalText(
                  text: SupervisorText.reportList,
                  type: TextType.bold,
                  fontSize: 16,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search, color: Colors.blue),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            // Daftar laporan scrollable
            Expanded(
              child: ListView.builder(
                itemCount: reports.length,
                itemBuilder: (context, index) {
                  final report = reports[index];
                  return ReportWidget(
                    month: report['month']!,
                    year: report['year']!,
                    onDownload: () => _downloadReport(report['month']!),
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
