// import 'package:custom_date_range_picker/custom_date_range_picker.dart';
// import 'package:flutter/material.dart';
//  ValueNotifier<DateTime?>  startDate=ValueNotifier(null);
//   DateTime? endDate;

// class DateRangePicker extends StatefulWidget {

//   const DateRangePicker({super.key});

//   @override
//   State<DateRangePicker> createState() => _DateRangePickerState();
// }

// class _DateRangePickerState extends State<DateRangePicker> {


//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton.icon(
//         onPressed: () {
//           showCustomDateRangePicker(context,
//               dismissible: true,
//               minimumDate: DateTime(2010),
//               maximumDate: DateTime.now(),
//               endDate: endDate,
//               startDate: startDate.value, onApplyClick: (start, end) {

//             setState(() {
//               endDate = end;
//               startDate.value = start;
//             });
//           }, onCancelClick: () {
//             setState(() {
//               endDate = null;
//               startDate.value = null;
//             });
//           }, backgroundColor: Colors.black, primaryColor: Colors.blue);
//         },
//         icon: const Icon(Icons.abc),
//         label: const Text('daterange'));
//   }
// }
