import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:movie_application/core/localization/app_localizations.dart';

class NotificationService {
  Future<void> saveNotif(int year, int month, int day, int hour, int minute,
      String title, String image, int id) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: id,
        notificationLayout: NotificationLayout.BigPicture,
        bigPicture: image,
        channelKey: 'scheduled_channel',
        title: AppLocalizations.instance.translate("notif_title") ?? "",
        body:
            "$title ${AppLocalizations.instance.translate('notif_body') ?? ""}",
      ),
      actionButtons: [
        NotificationActionButton(key: "MARK_DONE", label: "Mark Done")
      ],
      schedule: NotificationCalendar.fromDate(
          date: DateTime(year, month, day, hour, minute)),
    );
  }
}
