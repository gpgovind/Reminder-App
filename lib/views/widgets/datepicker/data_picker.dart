import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

DateTime date = DateTime.now();

class Dateselector extends StatefulWidget {
  const Dateselector({Key? key}) : super(key: key);

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
      if(value!=null){
         setState(() {
        dateline = value;
        date = value;
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
            icon: const Icon(
              Icons.date_range,
              color: Colors.blue,
            ),
          ),
        ),
        Text(DateFormat('yyyy-MM-dd').format(dateline)),
      ],
    );
  }
}
