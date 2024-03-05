import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import '../models/hive_services/data_model.dart';
import '../services/water_data_services.dart';

class WaterProviderController with ChangeNotifier implements WaterServiceData {
  final _waterGetData = Drinkbox.getdata();
  get waterGetData => _waterGetData;
  int waterValue = 0;

  @override
  setWaterNumberPickerValue(int value) {
    waterValue = value;
    notifyListeners();
  }

  @override
  goalRetriever({required final currentValue}) {
    Box<Watergoal> goalBox = Watergoal.getdata();
    Watergoal myGoal = Watergoal(addgoal: currentValue ?? 2000);
    goalBox.put(0, myGoal);

    notifyListeners();
    log('${goalBox.getAt(0)} total goal');
  }

  //********** */

  @override
  int displayGoal() {
    int value = Watergoal.getdata().get(0)?.addgoal ?? 0;
    return value;
  }

  //********** */

  @override
  Future<void> addWater() async {
    final box = Drinkbox.getdata();
    final currentDate = DateTime.now();

    final timeFormat = DateFormat('hh:mm');
    final currentTime = timeFormat.format(DateTime.now()).toString();

    final newDrinkbox =
        Drinkbox(time: currentTime, addWater: waterValue, date: currentDate);
    box.add(newDrinkbox);
    notifyListeners();
  }

  //********** */

  @override
  double getIndicatorValue() {
    final box = IndicatorValue.getdata();
    double indicatorValue = box.get(0)?.indicatorValue ?? 0;
    return indicatorValue;
  }

  @override
  indicatorValueAdd({required double value}) {
    double liquidTotal = 0;

    final box = IndicatorValue.getdata();
    final add = IndicatorValue(indicatorValue: value);
    box.put(0, add);
    log("${box.values.toString()} is box value");
    liquidTotal = box.get(0)!.indicatorValue;
    notifyListeners();
    log('$liquidTotal indiacatorvalueaddfunction');
  }

  //****** */

  @override
  Future<void> grap() async {
    Box<Drinkbox> box = Drinkbox.getdata();
    DateTime date = DateTime.now();
    double gValue = 0.0;
    double total = 0;
    final watergoal = Watergoal.getdata();
    for (Drinkbox element in box.values.toList()) {
      try {
        if (element.date.day == date.day &&
            element.date.month == date.month &&
            element.date.year == date.year) {
          double value = double.parse(element.addWater.toString());
          total += value;
        }
      } catch (e) {
        log('error occurred while parsing to double: $e');
      }
    }
    final goal = watergoal.values.isNotEmpty
        ? watergoal.values.first.addgoal.toDouble()
        : 0.0;

    double graphValue = total / goal;
    gValue = graphValue;
    log(total.toString());

    indicatorValueAdd(value: gValue);
    notifyListeners();
    log('${gValue.toString()} gvalue');
  }

  //********** */

  @override
  deleteWater(index, List<Drinkbox> data) {
    final value = data.removeAt(index);
    final box = Drinkbox.getdata();
    box.delete(value.key);
    grap();
    notifyListeners();
  }
}
