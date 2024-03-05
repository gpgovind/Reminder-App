// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/timezone.dart' as tz;
// import '../../../controller/medicine_provider.dart';
// import '../../widgets/medicine data/med_list.dart';

// class MedListState extends State<MedList> {
//   late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

//   @override
//   void initState() {
//     super.initState();
//     flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//   }

//   Future scheduleNotification(
//       String title, String body, DateTime scheduledTime) async {
//     const AndroidNotificationDetails androidPlatformChannelSpecifics =
//         AndroidNotificationDetails(
//       'your_channel_id',
//       'your_channel_name',
//       importance: Importance.max,
//       priority: Priority.high,
//       showWhen: false,
//     );

//     const NotificationDetails platformChannelSpecifics =
//         NotificationDetails(android: androidPlatformChannelSpecifics);

//     await flutterLocalNotificationsPlugin.zonedSchedule(
//       0,
//       title,
//       body,
//       tz.TZDateTime.from(scheduledTime, tz.local),
//       platformChannelSpecifics,
//       uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime,
//       androidAllowWhileIdle: true,
//     );
//   }

//   addNewMedicine() async {
//     MedicineProvider medicineProvider = MedicineProvider();
//     final box = medicineProvider.box;
//     String? data;
//     box.values.toList().forEach((element) {
//       data = element.medTime;
//     });

//     // Schedule the notification
//     await scheduleNotification('Medicine Reminder',
//         'It\'s time to take your medicine!', data as DateTime);
//   }

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
// }
