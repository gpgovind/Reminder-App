import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:water_reminder/models/hive_services/data_model.dart';
import 'package:water_reminder/views/pages/main_screens/home_Screen.dart';

import '../../views/widgets/number picker/drink_numberpicker.dart';
ValueNotifier<double> totalGoal = ValueNotifier(0);


// this function for getting the water value that selected by user 
Future <void> addWater() async {

  final box = Drinkbox.getdata();

  // final DateFormat dateFormat = DateFormat("MMMM d");
  final currentDate = DateTime.now();

  final timeFormat = DateFormat('hh:mm');
  final currentTime = timeFormat.format(DateTime.now()).toString();

  final newDrinkbox =
      Drinkbox(time: currentTime, addWater: waterAdd.value, date: currentDate);
  box.add(newDrinkbox);
  // indicatorValueNotifier.notifyListeners();
}

// this function for getting values from the medicine form 
medAdd(
    {required medController,
    required date,
    required medTime,
    required reasonController,
    required categoryController}) {
      // if user did't selects time  we will add current time format like this 
  final timeFormat = DateFormat('hh:mm');
  final currentTime = timeFormat.format(DateTime.now()).toString();

  final data = MedicinesAdd(
      date: date ?? DateTime.now(),
      medTime: medTime ?? currentTime,
      medicinename: medController.text,
      reason: reasonController.text,
      category: categoryController.text);
  final box = MedicinesAdd.getdata();
  box.add(data);
  data.save();
  medController.clear();
  categoryController.clear();
  reasonController.clear();
  log(box.toString());
}
// this indicator value  function getting a  double value form grap function and storing to  database filed called 
//inidcatorValue and we are assigning the value to liquidTotal and liquidTotal is a notifier and we will call that notifier on 
// LiquidCircularProgressIndicator and this will work  when user add the water the LiquidCircularProgressIndicator will work according to that
indicatorValueAdd({required double value}) {
 final box = IndicatorValue.getdata();
 final add = IndicatorValue(indicatorValue: value);
 box.put(0, add);
 log("${box.values.toString()} is box value");

 liquidTotal.value = 0;
 liquidTotal.value = box.get(0)!.indicatorValue;
 liquidTotal.notifyListeners();
 log('${liquidTotal.value} indiacatorvalueaddfunction');
}


// this function for getting the goal that selected by user 
 goalRetriever({required final currentValue})  {
  Box<Watergoal> goalBox = Watergoal.getdata();
  Watergoal myGoal = Watergoal(
  addgoal: currentValue ?? 2000);
  // log(myGoal.addgoal.toString());
  goalBox.put(0,myGoal);
 totalGoal.value=0; 
 totalGoal.value= Watergoal.getdata().get(0)!.addgoal.toDouble();

 totalGoal.notifyListeners();
 log('${totalGoal.value} total goal');
}
