import 'package:flutter/material.dart';

// ignore: prefer_typing_uninitialized_variables
var medTime;

class TimePicker extends StatefulWidget {
  const TimePicker({super.key});

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  TimeOfDay _timeOfDay = const TimeOfDay(hour: 8, minute: 40);
  void _showTimePicker() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
     if(value!=null){
       setState(() {
        _timeOfDay = value;
        medTime = _timeOfDay.format(context).toString();
      });
     }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: IconButton(
              onPressed: _showTimePicker,
              icon: const Icon(
                Icons.timer,
                color: Colors.blue,
              )),
        ),
        Text(_timeOfDay.format(context).toString())
      ],
    );
  }
}
