import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:water_reminder/views/pages/main_screens/search.dart';
import '../../../models/hive_services/data_model.dart';
import '../../dialogs/notification/notification.dart';
import '../../widgets/animated icon.dart/animatd_icon1.dart';
import '../../widgets/filter/filter.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

import '../../widgets/water screen data/pop_up.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  List<String> items = ['Completed', 'Pending', 'Water'];
  // ignore: non_constant_identifier_names
  String? selectedItem = 'Pending';

  @override
  void initState() {
    Drinkbox.getdata().values;
    MedicinesAdd.getdata().values;
    MedCompleted.getdata().values;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('lib/assets/images/gradientbb.gif')),
      ),
      child: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: AnimatedIcon1(
              key: UniqueKey(),
              icon1: const Icon(
                Icons.search,
                color: Colors.blue,
              ),
              icon2: const Icon(Icons.search, color: Colors.blue),
              onPressed: () async {
                await showSearch(context: context, delegate: Search());
              },
            ),
            actions: const [Filter()],
            backgroundColor: Colors.transparent,
            title: Text(
              'History',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            centerTitle: true,
          ),
          backgroundColor: Colors.transparent,
          body: Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.only(left: 16.9, right: 16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.blue, width: 2.0),
                ),
                child: DropdownButton(
                  // hint: const Text('select '),
                  borderRadius: BorderRadius.circular(20),
                  dropdownColor: Colors.white,
                  elevation: 5,
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 36.0,
                  isExpanded: true,
                  value: selectedItem,
                  items: items.map((value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedItem = value;
                    });
                  },
                ),
              ),
            ),

            //................
            const SizedBox(
              height: 5,
            ),

            if (selectedItem == 'Water')
              ValueListenableBuilder(
                valueListenable: dateRangeNotifier,
                builder: (context, dateRange, child) {
                  return ValueListenableBuilder(
                    valueListenable: filterH,
                    builder: (context, value, child) {
                      return Expanded(
                          child: ValueListenableBuilder<Box<Drinkbox>>(
                        valueListenable: Drinkbox.getdata().listenable(),
                        builder: (context, box, _) {
                          var dataList = box.values.toList().cast<Drinkbox>();
                          //
                          List<Drinkbox> dateFilteredList = [];
                          if (dateRange != null) {
                            for (var element in dataList) {
                              if (element.date.isAfter(dateRange.start
                                      .subtract(const Duration(days: 1))) &&
                                  element.date.isBefore(dateRange.end
                                      .add(const Duration(days: 1)))) {
                                dateFilteredList.add(element);
                              }
                            }
                            dataList = dateFilteredList;
                          }
                          return dataList.isEmpty
                              ? Center(
                                  child: Image.asset(
                                      'lib/assets/images/no-data.gif'),
                                )
                              : ListView.separated(
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                    height: 10,
                                  ),
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: dataList.length,
                                  itemBuilder: (context, index) {
                                    final data = box.getAt(index);
                                    return Bounceable(
                                        onTap: () {},
                                        child: Dismissible(
                                          key: UniqueKey(),
                                          onDismissed: (direction) {
                                            // Remove the item from the list
                                            box.deleteAt(index);
                                          },
                                          child: BlurryContainer(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              width: double.infinity,
                                              height: 68.h,
                                              color: const Color(0xFF35BAFF)
                                                  .withOpacity(0.8),
                                              blur: 1,
                                              elevation: 2,
                                              child: ListTile(
                                                title: Text(
                                                    ' ${data!.addWater}',
                                                    style: const TextStyle(
                                                        color: Colors.white)),
                                                subtitle: Text(
                                                  ' ${data.time}',
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                                trailing: Text(
                                                    DateFormat("MMMM d")
                                                        .format(data.date),
                                                    style: const TextStyle(
                                                        color: Colors.white)),
                                              )),
                                        ));
                                  },
                                );
                        },
                      ));
                    },
                  );
                },
              ),

            //.....................

            if (selectedItem == 'Completed')
              ValueListenableBuilder(
                valueListenable: dateRangeNotifier,
                builder: (context, dateRange, child) {
                  return ValueListenableBuilder(
                    valueListenable: filterH,
                    builder: (context, value, child) {
                      return Expanded(
                          child: ValueListenableBuilder<Box<MedCompleted>>(
                        valueListenable: MedCompleted.getdata().listenable(),
                        builder: (context, box, _) {
                          var dataList =
                              box.values.toList().cast<MedCompleted>();
                          //
                          List<MedCompleted> dateFilteredList = [];
                          if (dateRange != null) {
                            for (var element in dataList) {
                              if (element.date.isAfter(dateRange.start
                                      .subtract(const Duration(days: 1))) &&
                                  element.date.isBefore(dateRange.end
                                      .add(const Duration(days: 1)))) {
                                dateFilteredList.add(element);
                              }
                            }
                            dataList = dateFilteredList;
                          }
                          return dataList.isEmpty
                              ? Center(
                                  child: Image.asset(
                                      'lib/assets/images/no-data.gif'),
                                )
                              : ListView.separated(
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                    height: 10,
                                  ),
                                  itemCount: dataList.length,
                                  itemBuilder: (context, index) {
                                    final data = box.getAt(index);
                                    return Dismissible(
                                        key: UniqueKey(),
                                        onDismissed: (direction) {
                                          // Remove the item from the list
                                          box.deleteAt(index);
                                        },
                                        child: BlurryContainer(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            width: double.infinity,
                                            height: 68.h,
                                            color:
                                                Colors.green.withOpacity(0.5),
                                            blur: 1,
                                            elevation: 2,
                                            child: ListTile(
                                              title: Text(
                                                  'Medicine: ${data!.medicinename}',
                                                  style: const TextStyle(
                                                      color: Colors.white)),
                                              subtitle: Text(
                                                  'Reason: ${data.reason}',
                                                  style: const TextStyle(
                                                      color: Colors.white)),
                                              trailing: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(data.medTime.toString(),
                                                      style: const TextStyle(
                                                          color: Colors.white)),
                                                  Text(
                                                      DateFormat("MMMM d")
                                                          .format(data.date),
                                                      style: const TextStyle(
                                                          color: Colors.white)),
                                                ],
                                              ),
                                            )));
                                  },
                                );
                        },
                      ));
                    },
                  );
                },
              ),

            //..................

            if (selectedItem == 'Pending')
              ValueListenableBuilder(
                valueListenable: dateRangeNotifier,
                builder: (context, dateRange, child) {
                  return ValueListenableBuilder(
                    valueListenable: filterH,
                    builder: (context, value, child) {
                      return Expanded(
                          child: ValueListenableBuilder<Box<MedicinesAdd>>(
                        valueListenable: MedicinesAdd.getdata().listenable(),
                        builder: (context, box, _) {
                          var dataList =
                              box.values.toList().cast<MedicinesAdd>();
                          //
                          List<MedicinesAdd> dateFilteredList = [];
                          if (dateRange != null) {
                            for (var element in dataList) {
                              if (element.date.isAfter(dateRange.start
                                      .subtract(const Duration(days: 1))) &&
                                  element.date.isBefore(dateRange.end
                                      .add(const Duration(days: 1)))) {
                                dateFilteredList.add(element);
                              }
                            }
                            dataList = dateFilteredList;
                          }
                          return dataList.isEmpty
                              ? Center(
                                  child: Image.asset(
                                      'lib/assets/images/no-data.gif'),
                                )
                              : ListView.separated(
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                    height: 10,
                                  ),
                                  itemCount: dataList.length,
                                  itemBuilder: (context, index) {
                                    final data = box.getAt(index);
                                    return Dismissible(
                                        key: UniqueKey(),
                                        onDismissed: (direction) {
                                          // Remove the item from the list
                                          box.deleteAt(index);
                                        },
                                        child: BlurryContainer(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            width: double.infinity,
                                            height: 68.h,
                                            color: const Color(0xff9b59b6)
                                                .withOpacity(0.7),
                                            blur: 1,
                                            elevation: 2,
                                            child: Center(
                                              child: ListTile(
                                                title: Text(
                                                  'Medicine: ${data!.medicinename}',
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                                subtitle: Text(
                                                    'Reason: ${data.reason}',
                                                    style: const TextStyle(
                                                        color: Colors.white)),
                                                trailing: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Text(
                                                        data.medTime.toString(),
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.white)),
                                                    Text(
                                                        DateFormat("MMMM d")
                                                            .format(data.date),
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.white)),
                                                  ],
                                                ),
                                              ),
                                            )));
                                  },
                                );
                        },
                      ));
                    },
                  );
                },
              )
          ]),
        ),
      )),
    );
  }
}
