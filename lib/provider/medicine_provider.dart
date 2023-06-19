import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:water_reminder/models/hive_services/data_model.dart';

class MedicineProvider with ChangeNotifier {
// this function for getting values from the medicine form
  final box = MedicinesAdd.getdata();
  // DateTimeRange? selectedDateRange;

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
    notifyListeners();
    log(box.toString());
  }

  medCompleted(
      {required String medicineName,
      required String reason,
      required String category,
      required String medTime,
      required DateTime medDate}) {
    MedCompleted med = MedCompleted(
        medicinename: medicineName,
        reason: reason,
        category: category,
        medTime: medTime,
        date: medDate);
    MedCompleted.getdata().add(med);
    med.save();

    notifyListeners();
  }

    deleteMedicine(index, List<MedicinesAdd> data) {
    final value = data.removeAt(index);
    final box = MedicinesAdd.getdata();
    box.delete(value.key);
    notifyListeners();
  }
}
