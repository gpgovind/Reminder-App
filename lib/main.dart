import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'models/hive_services/data_model.dart';
import 'controller/medicine_provider.dart';
import 'controller/water_provider.dart';
import 'views/pages/flash and skip screen/first_page.dart';
import 'package:hive/hive.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getApplicationDocumentsDirectory();

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
  await Alarm.init(showDebugLogs: true);
  await Alarm.checkAlarm();

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
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => WaterProviderController()),
          ChangeNotifierProvider(create: (_) => MedicineController()),
        ],
        child: ScreenUtilInit(
          builder: (context, child) => MaterialApp(
            builder: EasyLoading.init(),
            debugShowCheckedModeBanner: false,
            theme: ThemeData(useMaterial3: true),
            home: const FlashScreen(),
          ),
          designSize: ScreenUtil.defaultSize,
        ));
  }
}
