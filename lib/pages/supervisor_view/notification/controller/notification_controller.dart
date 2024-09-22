import 'package:gerald/pages/supervisor_view/notification/widgets/notification_card.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  var notifications = <NotificationCard>[].obs;
  var isSortedAscending = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadDummyData();
  }

void loadDummyData() {
  notifications.addAll([
    const NotificationCard(
      title: 'Rumah Pompa Kedung Cowek',
      description: 'Pompa Mati Sementara',
      date: '21/09/2024',
    ),
    const NotificationCard(
      title: 'Rumah Pompa Dukuh Kupang',
      description: 'Pompa Kembali Beroperasi',
      date: '20/09/2024',
    ),
    const NotificationCard(
      title: 'Rumah Pompa Karang Pilang',
      description: 'Pemeliharaan Selesai',
      date: '19/09/2024',
    ),
    const NotificationCard(
      title: 'Rumah Pompa Gunung Anyar',
      description: 'Level Air Naik 20 cm',
      date: '18/09/2024',
    ),
    const NotificationCard(
      title: 'Rumah Pompa Bratang',
      description: 'Pemeriksaan Rutin Selesai',
      date: '17/09/2024',
    ),
    const NotificationCard(
      title: 'Rumah Pompa Jagir',
      description: 'Debit Air Meningkat',
      date: '16/09/2024',
    ),
    const NotificationCard(
      title: 'Rumah Pompa Wonorejo',
      description: 'Level Air Stabil',
      date: '15/09/2024',
    ),
    const NotificationCard(
      title: 'Rumah Pompa Ngagel',
      description: 'Pompa Beroperasi Normal',
      date: '14/09/2024',
    ),
    const NotificationCard(
      title: 'Rumah Pompa Kenjeran',
      description: 'Air Meningkat 30 cm',
      date: '13/09/2024',
    ),
    const NotificationCard(
      title: 'Rumah Pompa Mulyosari (Ring Road ITS)',
      description: 'Genangan Mulai Terlihat',
      date: '12/09/2024',
    ),
  ]);
}


}
