import 'dart:developer';

import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';

import '../models/hive_services/data_model.dart';
import '../services/med_data_services.dart';

class MedicineController with ChangeNotifier implements MedServices {
  final box = MedicinesAdd.getdata();

  @override
  medicineAdd(
      {required String medController,
      required DateTime date,
      required DateTime medTime,
      required String reasonController,
      required String categoryController}) async {
    // final timeFormat = DateFormat('hh:mm');
    // final currentTime = timeFormat.format(DateTime.now()).toString();

    final data = MedicinesAdd(
        date: date,
        medTime: medTime,
        medicinename: medController,
        reason: reasonController,
        category: categoryController);
    final box = MedicinesAdd.getdata();
    await box.add(data);
    data.save();
    notifyListeners();
    log(box.toString());
  }

  @override
  medicineCompleted(
      {required String medicineName,
      required DateTime date,
      required String medTime,
      required String reason,
      required String category}) async {
    MedCompleted med = MedCompleted(
        medicinename: medicineName,
        reason: reason,
        category: category,
        medTime: medTime,
        date: date);
    await MedCompleted.getdata().add(med);
    med.save();

    notifyListeners();
  }

  @override
  deleteMedicine({required int index, required List<MedicinesAdd> data}) async {
    final value = data.removeAt(index);
    final box = MedicinesAdd.getdata();
    await Alarm.stop(index);
    box.delete(value.key);
    notifyListeners();
  }
}
