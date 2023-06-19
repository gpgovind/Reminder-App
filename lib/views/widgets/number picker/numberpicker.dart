import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';
import 'package:water_reminder/provider/water_provider.dart';

import '../../dialogs/notification/notification.dart';

class GoalNumberPicker extends StatelessWidget {
  const GoalNumberPicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<WaterProvider>(
      builder: (context, waterProvider, _) {
        final int goalProvider = waterProvider
            .displayGoal(); // Retrieve the goal value from the WaterProvider
//  context.read<WaterProvider>().getWaterNumberPickerValue(newValue);
        return SizedBox(
          width: 350.w,
          height: 200.h,
          child: Column(
            children: <Widget>[
              NumberPicker(
                value: goalProvider,
                minValue: 0,
                step: 1000,
                maxValue: 100000,
                onChanged: (value) {
                  (value == 0)
                      ? zeroNotAllowedAlert(context)
                      : waterProvider.goalRetriever(currentValue: value);
                },
              ),
              Text(
                'Current value: $goalProvider',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
