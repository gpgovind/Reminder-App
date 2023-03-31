import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../../models/hive_services/data_functions.dart';
import '../../../models/hive_services/data_model.dart';


 ValueNotifier<double> gValue = ValueNotifier(0.0);
Future<void> grap(Box<Drinkbox> box, DateTime date) async {
  double total = 0;
  final watergoal = Watergoal.getdata();
  for (var element in box.values.toList()) {
    try {
      if (element.date.day == date.day && element.date.month == date.month && element.date.year == date.year) {
        double value = double.parse(element.addWater.toString());
        total += value;
      }
    } catch (e) {
      log('error occurred while parsing to double: $e');
      // handle the exception here, e.g. log an error or show an error message to the user
    }
  }
  // final goal = watergoal.values.first.addgoal;
  final  goal = watergoal.values.isNotEmpty ? watergoal.values.first.addgoal.toDouble(): 0.0;


  double graphValue = total / goal;
  gValue.value = graphValue;
  log(total.toString());

  indicatorValueAdd(value:gValue.value);
  gValue.notifyListeners();
 log('${gValue.toString()} gvalue');
 

}




