import 'package:awesome_notifications/awesome_notifications.dart';

class NotificationService {
  Future<void> saveNotif(int year, int month, int day, int hour, int minute,
      String title, String image, int id) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: id,
        notificationLayout: NotificationLayout.BigPicture,
        bigPicture: image,
        channelKey: 'scheduled_channel',
        title: "Playing Now🥳🥳🥳",
        body: "$title now playing",
      ),
      actionButtons: [
        NotificationActionButton(key: "MARK_DONE", label: "Mark Done")
      ],
      schedule: NotificationCalendar.fromDate(
          date: DateTime(year, month, day, hour, minute)),
    );
  }
}
