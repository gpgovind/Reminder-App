import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';
import 'package:water_reminder/provider/water_provider.dart';

// ignore: prefer_typing_uninitialized_variables
// var waterAdd ;

// ValueNotifier<int> waterAdd = ValueNotifier<int>(0);

class AddWaterNUmberPicker extends StatefulWidget {
  const AddWaterNUmberPicker({super.key});

  @override
  State<AddWaterNUmberPicker> createState() => _AddWaterNUmberPickerState();
}

class _AddWaterNUmberPickerState extends State<AddWaterNUmberPicker> {
  @override
  Widget build(BuildContext context) {
    return Consumer<WaterProvider>(builder: (context, waterProvider, child) {
      return SizedBox(
        width: 350.w,
        height: 200.h,
        child: Column(
          children: <Widget>[
            NumberPicker(
              haptics: true,
              value: waterProvider.waterValue,
              minValue: 0,
              step: 100,
              maxValue: 100000,
              onChanged: (newValue) {
                // waterProvider.waterValue=newValue;
                waterProvider.setWaterNumberPickerValue(newValue);
              },
            ),
            Text(
              'Current value: ${waterProvider.waterValue}',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
              ),
            ),
          ],
        ),
      );
    });
  }
}
