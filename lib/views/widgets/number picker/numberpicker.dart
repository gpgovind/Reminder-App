import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:water_reminder/models/hive_services/data_model.dart';
import '../../../models/hive_services/data_functions.dart';

ValueNotifier<int>golNotifier=ValueNotifier<int>(Watergoal.getdata().get(0)?.addgoal ?? 0);


class GoalNumberPicker extends StatefulWidget {
  const GoalNumberPicker({super.key});

  @override
  State<GoalNumberPicker> createState() => _GoalNumberPickerState();
}

class _GoalNumberPickerState extends State<GoalNumberPicker> {
 

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350.w,
      height: 200.h,
      child: Column(
        children: <Widget>[
          NumberPicker(
              value: golNotifier.value,
              minValue: 0,
              step: 1000,
              maxValue: 100000,
              onChanged: (value) {
                setState(() {
                 golNotifier.value = value;

                  goalRetriever(currentValue: golNotifier.value);
                });
              }),
          Text(
            'Current value: ${golNotifier.value}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
