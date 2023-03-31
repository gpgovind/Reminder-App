import 'package:hive/hive.dart';

part 'data_model.g.dart';

// for storing water drink details

@HiveType(typeId: 0)
class Drinkbox extends HiveObject {
  @HiveField(0)
  final String time;

  @HiveField(1)
  final int addWater;

  @HiveField(2)
  final DateTime date;

  Drinkbox({
    required this.time,
    required this.addWater,
    required this.date,
  });

  static Box<Drinkbox> getdata() => Hive.box<Drinkbox>('drinkwater');
}

// for storing medicine data
@HiveType(typeId: 1)
// the reason to extends the hiveobject because its provide us the save property
// and new functionalities too
class MedicinesAdd extends HiveObject {
  @HiveField(0)
  bool isCompleted = false;
  @HiveField(1)
  final String medicinename;
  @HiveField(2)
  final String reason;
  @HiveField(3)
  final String category;
  @HiveField(4)
  final String medTime;
  @HiveField(5)
  final DateTime date;

  MedicinesAdd({
    required this.date,
    required this.medTime,
    required this.medicinename,
    required this.reason,
    required this.category,
    // required this.medtime
  });

  static Box<MedicinesAdd> getdata() => Hive.box<MedicinesAdd>('medicinebox');
}

// storing the goal the given by user
@HiveType(typeId: 2)
class Watergoal extends HiveObject {
  @HiveField(0)
  final int addgoal;

  Watergoal({required this.addgoal});

  static Box<Watergoal> getdata() => Hive.box<Watergoal>('goalbox');
}

//  storing medicine completed data
@HiveType(typeId: 3)
class MedCompleted extends HiveObject {
  @HiveField(0)
  final String medicinename;
  @HiveField(1)
  final String reason;
  @HiveField(2)
  final String category;
  @HiveField(3)
  final String medTime;
  @HiveField(4)
  final DateTime date;

  MedCompleted(
      this.medicinename, this.reason, this.category, this.medTime, this.date);

  static Box<MedCompleted> getdata() => Hive.box<MedCompleted>('MedCompleted');
}

// this box  for getting the value form grap function and storing on indicator value
@HiveType(typeId: 4)
class IndicatorValue extends HiveObject {
  @HiveField(0)
  final double indicatorValue;

  IndicatorValue({required this.indicatorValue});

  static Box<IndicatorValue> getdata() =>
      Hive.box<IndicatorValue>('IndicatorBox');
}
