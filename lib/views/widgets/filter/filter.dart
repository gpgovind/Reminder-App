

import 'package:flutter/material.dart';

// ValueNotifier<DateTimeRange?>dateRangeNotifier=ValueNotifier(null);

class Filter extends StatefulWidget {
  // final Function(DateTimeRange)? onDateRangeSelected;

  const Filter({Key? key, }) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

ValueNotifier<DateTimeRange?> dateRangeNotifier = ValueNotifier(null);

class _FilterState extends State<Filter> {
  DateTimeRange? selectedDateRange;

  void _showDateRangePicker() async {
   dateRangeNotifier.value=await showDateRangePicker(
      context: context,
      firstDate: DateTime(2001),
      lastDate: DateTime(2030),
      currentDate: DateTime.now(),
      saveText: 'done',
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            buttonTheme: const ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
            colorScheme: const ColorScheme.light(primary: Colors.purple)
                .copyWith(secondary: Colors.purple),
          ),
          child: child!,
        );
      },
    );
if (dateRangeNotifier.value != null) {
      print(dateRangeNotifier.value!.start.toString());
      setState(() {
       selectedDateRange = dateRangeNotifier.value;
      });
    }
    dateRangeNotifier.notifyListeners();
 
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: (){
       _showDateRangePicker();
   
    },icon: const Icon(Icons.date_range),color: Colors.blue,);
  }
}