import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class WaterTile extends StatelessWidget {
  String ml;

  String time;

  DateTime date;

  WaterTile(
      {super.key, required this.ml, required this.time, required this.date});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: Text(
            '$ml ml',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.sp,
              // fontWeight: FontWeight.bold
            ),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                DateFormat("MMMM d").format(date),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.sp,
                  // fontWeight: FontWeight.bold
                ),
              ),
              Text(
                time,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.sp,
                  // fontWeight: FontWeight.bold
                ),
              )
            ],
          ),
        ));
  }
}
