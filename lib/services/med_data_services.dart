import '../models/hive_services/data_model.dart';

abstract class MedServices {
 Future medicineCompleted(
      {required String medicineName,
      required DateTime date,
      required String medTime,
      required String reason,
      required String category});

 Future medicineAdd(
      {required String medController,
      required DateTime date,
      required DateTime medTime,
      required String reasonController,
      required String categoryController});

  deleteMedicine({
    required int index,
    required List<MedicinesAdd> data,
  });
}
