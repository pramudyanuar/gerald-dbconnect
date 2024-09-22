import 'package:gerald/core/services/api_endpoints.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class MonthlyReportController extends GetxController {
  // List of reports with month and year
  final reports = [
    {'month': 'september', 'year': '2024'},
    {'month': 'Mei', 'year': '2024'},
    {'month': 'April', 'year': '2024'},
  ].obs; // Using .obs for reactivity

  // Method to download the report
  Future<http.Response?> downloadReport(String month) async {
    try {
      final response = await http.get(Uri.parse(ApiEndpoints.reportDownload+'/$month'));

      if (response.statusCode == 200) {
        return response;
      } else {
        print('Failed to download the report for $month. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error downloading report: $e');
    }
    return null;
  }
}
