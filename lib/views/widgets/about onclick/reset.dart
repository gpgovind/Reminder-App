import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:quickalert/quickalert.dart';
import 'package:water_reminder/models/hive_services/data_model.dart';
import 'package:water_reminder/provider/water_provider.dart';
import 'package:water_reminder/views/widgets/number%20picker/drink_numberpicker.dart';
import '../../pages/flash and skip screen/first_page.dart';

Future<void> deleteAllData(context) async {
  Box<Drinkbox> waterGoalBox = Drinkbox.getdata();
  Box<MedicinesAdd> medicineBox = MedicinesAdd.getdata();
  Box<Watergoal> categoryBox = Watergoal.getdata();
  Box<IndicatorValue> indiValue = IndicatorValue.getdata();
  // SharedPreferences preferences = await SharedPreferences.getInstance();
  // preferences.clear();
 WaterProvider().goalRetriever(currentValue: 0);
  WaterProvider().waterValue= 0;
  Box<MedCompleted> medCompleted = MedCompleted.getdata();
  await waterGoalBox.clear();
  await  medicineBox.clear();
  await categoryBox.clear();
  await medCompleted.clear();
  await indiValue.clear();
 
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (build) => const FlashScreen()),
      (route) => false);
}

void showAlertReset(BuildContext context) {
  QuickAlert.show(
      context: context,
      title: 'Do you want to reset',
      onConfirmBtnTap: () {
        deleteAllData(context);
      },
      type: QuickAlertType.warning);
}


