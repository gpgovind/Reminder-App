import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Dateselector extends StatefulWidget {
  final Function(DateTime)? dateTime;

  const Dateselector({Key? key, this.dateTime}) : super(key: key);

  @override
  State<Dateselector> createState() => _DateselectorState();
}

class _DateselectorState extends State<Dateselector> {
  // creating dateline variable
  DateTime dateline = DateTime.now();

  // show date picker method
  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    ).then((value) {
      if (value != null) {
        setState(() {
          dateline = value;

          if (widget.dateTime != null) {
            widget.dateTime!(value);
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // to display chosen date

        Center(
          // button
          child: IconButton(
            onPressed: _showDatePicker,
            icon: Icon(
              Icons.date_range,
              color: Colors.green[500],
            ),
          ),
        ),
        Text(DateFormat('yyyy-MM-dd').format(dateline)),
      ],
    );
  }
}
