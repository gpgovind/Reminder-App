import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'package:water_reminder/models/hive_services/data_model.dart';
import 'views/pages/flash and skip screen/first_page.dart';
import 'package:hive/hive.dart';


Future<void> main() async {
//  initializeDateFormatting('en_IN', null);
  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getApplicationDocumentsDirectory();
  // *path is holding a folder that store app's data
  // *path helps to create directory
  // *directory is used to providing the path
  Hive.init(directory.path);

  Hive.registerAdapter(MedicinesAddAdapter());
  await Hive.openBox<MedicinesAdd>('medicinebox');

  Hive.registerAdapter(DrinkboxAdapter());
  await Hive.openBox<Drinkbox>('drinkwater');

  Hive.registerAdapter(WatergoalAdapter());
  await Hive.openBox<Watergoal>('goalbox');

  Hive.registerAdapter(MedCompletedAdapter());
  await Hive.openBox<MedCompleted>('MedCompleted');

  Hive.registerAdapter(IndicatorValueAdapter());
  await Hive.openBox<IndicatorValue>('IndicatorBox');

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp(
        theme: ThemeData(useMaterial3: true),
        home: const FlashScreen(),
      ),
      designSize:ScreenUtil.defaultSize,
    );
  }
}
