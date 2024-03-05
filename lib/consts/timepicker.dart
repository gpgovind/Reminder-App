import 'package:flutter/material.dart';

class TimePicker extends StatefulWidget {
  final Function(DateTime)? onTimeSelected;

  const TimePicker({Key? key, this.onTimeSelected}) : super(key: key);

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  TimeOfDay _timeOfDay = const TimeOfDay(hour: 8, minute: 40);

  void _showTimePicker() async {
    final TimeOfDay? value = await showTimePicker(
      context: context,
      initialTime: _timeOfDay,
    );

    if (value != null) {
      setState(() {
        _timeOfDay = value;
        if (widget.onTimeSelected != null) {
          // Convert TimeOfDay to DateTime using a dummy date (today's date)
          DateTime selectedDateTime = DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
            _timeOfDay.hour,
            _timeOfDay.minute,
          );
          widget.onTimeSelected!(selectedDateTime);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: IconButton(
            onPressed: _showTimePicker,
            icon: Icon(
              Icons.timer,
              color: Colors.green[500],
            ),
          ),
        ),
        Text(_timeOfDay.format(context).toString())
      ],
    );
  }
}
