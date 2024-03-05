import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:quickalert/quickalert.dart';

import '../../../models/hive_services/data_model.dart';
import '../../../controller/water_provider.dart';
import '../../pages/flash and skip screen/first_page.dart';

Future<void> deleteAllData(context) async {
  Box<Drinkbox> waterGoalBox = Drinkbox.getdata();
  Box<MedicinesAdd> medicineBox = MedicinesAdd.getdata();
  Box<Watergoal> categoryBox = Watergoal.getdata();
  Box<IndicatorValue> indiValue = IndicatorValue.getdata();
  // SharedPreferences preferences = await SharedPreferences.getInstance();
  // preferences.clear();
 WaterProviderController().goalRetriever(currentValue: 0);
  WaterProviderController().waterValue= 0;
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


