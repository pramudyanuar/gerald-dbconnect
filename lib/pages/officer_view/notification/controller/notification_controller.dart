import 'package:gerald/core/constants/images.dart';
import 'package:gerald/pages/officer_view/notification/widgets/alert_card.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  List<NotificationCard> notifications = [
  const NotificationCard(
    title: 'Peringatan Banjir',
    description: 'Rumah Pompa Mulyosari (Ring Road ITS)',
    date: '12/09/2024',
    imagePath: Images.redWarning,
  ),
  const NotificationCard(
    title: 'Ketinggian Air Normal',
    description: 'Rumah Pompa Mulyosari (Ring Road ITS)',
    date: '11/09/2024',
    imagePath: Images.yellowWarning,
  ),
  const NotificationCard(
    title: 'PKetinggian Air Normal',
    description: 'Rumah Pompa Mulyosari (Ring Road ITS)',
    date: '10/09/2024',
    imagePath: Images.yellowWarning,
  ),
  const NotificationCard(
    title: 'Ketinggian Air Normal',
    description: 'Rumah Pompa Mulyosari (Ring Road ITS)',
    date: '09/09/2024',
    imagePath: Images.yellowWarning,
  ),
  const NotificationCard(
    title: 'Peringatan Banjir',
    description: 'Rumah Pompa Mulyosari (Ring Road ITS)',
    date: '08/09/2024',
    imagePath: Images.redWarning,
  ),
  const NotificationCard(
    title: 'Peringatan Banjir',
    description: 'Rumah Pompa Mulyosari (Ring Road ITS)',
    date: '07/09/2024',
    imagePath: Images.redWarning,
  ),
  // Tambahkan notifikasi tambahan di sini jika diperlukan
];

}