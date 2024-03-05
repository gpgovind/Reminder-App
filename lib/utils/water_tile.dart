import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class WaterTile extends StatelessWidget {
  String ml;

  String time;

  DateTime date;

  WaterTile(
      {super.key, required this.ml, required this.time, required this.date});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            '$ml ml',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.sp,
              // fontWeight: FontWeight.bold
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Text(
            DateFormat("MMMM d").format(date),
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.sp,
              // fontWeight: FontWeight.bold
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Text(
            time,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.sp,
              // fontWeight: FontWeight.bold
            ),
          ),
        )
      ],
    );
  }
}
