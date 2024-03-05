import 'package:alarm/alarm.dart';

AlarmSettings alarm(
    {required DateTime dateTime,
    String? notificationTitle,
    required int id,
    String? notificationBody}) {
  final alarmSettings = AlarmSettings(
    id: id,
    dateTime: dateTime,
    assetAudioPath: 'lib/assets/alarm.mp3',
    loopAudio: true,
    vibrate: true,
    fadeDuration: 3.0,
    notificationTitle: notificationTitle,
    notificationBody: notificationBody,
    volumeMax: true,
    enableNotificationOnKill: true,
  );
  return alarmSettings;
}

Future setAlarm(
    {required DateTime dateTime,
    String? notificationTitle,
    required int id,
    String? notificationBody}) async {
  await Alarm.set(
      alarmSettings: alarm(
          id: id,
          dateTime: dateTime,
          notificationBody: notificationBody,
          notificationTitle: notificationTitle));
}
