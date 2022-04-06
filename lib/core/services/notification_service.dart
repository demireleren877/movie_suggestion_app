import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';

class NotificationService {
  Future<void> saveNotif(
      int year, int month, int day, int hour, int minute) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: Random().nextInt(1000),
        notificationLayout: NotificationLayout.Default,
        channelKey: 'scheduled_channel',
        title: 'Scheduled Notification',
        body: 'Simple body',
      ),
      schedule: NotificationCalendar.fromDate(
          date: DateTime(year, month, day, hour, minute)),
    );
  }
}
