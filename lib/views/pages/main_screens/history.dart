import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:updated_water_app/views/pages/main_screens/search.dart';
import '../../../models/hive_services/data_model.dart';
import '../../../utils/app_background_image.dart';
import '../../widgets/filter/filter.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

import '../../widgets/history card widgets/medicine_card_widget.dart';
import '../../widgets/history card widgets/water_card_widget.dart';

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
    return BackgroundImage(
      child: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(
                onPressed: () async {
                  await showSearch(context: context, delegate: Search());
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.blue,
                  size: 30,
                )),
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
              child: DropdownButtonFormField2<String>(
                isExpanded: true,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                hint: const Text(
                  'Pending',
                  style: TextStyle(fontSize: 14),
                ),
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
                buttonStyleData: const ButtonStyleData(
                  padding: EdgeInsets.only(right: 8),
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black45,
                  ),
                  iconSize: 24,
                ),
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Container(
            //     padding: const EdgeInsets.only(left: 16.9, right: 16.0),
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(30),
            //       border: Border.all(color: Colors.blue, width: 2.0),
            //     ),
            //     child: DropdownButton(
            //       // hint: const Text('select '),
            //       borderRadius: BorderRadius.circular(20),
            //       dropdownColor: Colors.white,

            //       icon: const Icon(Icons.arrow_drop_down),
            //       iconSize: 36.0,
            //       isExpanded: true,
            //       value: selectedItem,
            //       items: items.map((value) {
            //         return DropdownMenuItem(
            //           value: value,
            //           child: Text(value),
            //         );
            //       }).toList(),
            //       onChanged: (value) {
            //         setState(() {
            //           selectedItem = value;
            //         });
            //       },
            //     ),
            //   ),
            // ),

            //................
            const SizedBox(
              height: 5,
            ),

            if (selectedItem == 'Water')
              ValueListenableBuilder(
                valueListenable: dateRangeNotifier,
                builder: (context, dateRange, child) {
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
                              element.date.isBefore(
                                  dateRange.end.add(const Duration(days: 1)))) {
                            dateFilteredList.add(element);
                          }
                        }
                        dataList = dateFilteredList;
                      }
                      return dataList.isEmpty
                          ? Center(
                              child:
                                  Image.asset('lib/assets/images/no_data.gif'),
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
                                      child: HistoryCardWidget(
                                        date: DateFormat("MMMM d")
                                            .format(data!.date),
                                        water: data.addWater.toString(),
                                        time: data.time,
                                      )),
                                );
                              },
                            );
                    },
                  ));
                },
              ),

            //.....................

            if (selectedItem == 'Completed')
              ValueListenableBuilder(
                valueListenable: dateRangeNotifier,
                builder: (context, dateRange, child) {
                  return Expanded(
                      child: ValueListenableBuilder<Box<MedCompleted>>(
                    valueListenable: MedCompleted.getdata().listenable(),
                    builder: (context, box, _) {
                      var dataList = box.values.toList().cast<MedCompleted>();
                      //
                      List<MedCompleted> dateFilteredList = [];
                      if (dateRange != null) {
                        for (var element in dataList) {
                          if (element.date.isAfter(dateRange.start
                                  .subtract(const Duration(days: 1))) &&
                              element.date.isBefore(
                                  dateRange.end.add(const Duration(days: 1)))) {
                            dateFilteredList.add(element);
                          }
                        }
                        dataList = dateFilteredList;
                      }
                      return dataList.isEmpty
                          ? Center(
                              child:
                                  Image.asset('lib/assets/images/no_data.gif'),
                            )
                          : ListView.separated(
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                height: 10,
                              ),
                              itemCount: dataList.length,
                              itemBuilder: (context, index) {
                                final data = box.getAt(index);
                                final time = DateTime.parse(data!.medTime);
                                return Dismissible(
                                  key: UniqueKey(),
                                  onDismissed: (direction) {
                                    // Remove the item from the list
                                    box.deleteAt(index);
                                  },
                                  child: MedicineCardWidget(
                                    date:
                                        DateFormat("MMMM d").format(data.date),
                                    medicine: data.medicinename,
                                    reason: data.reason,
                                    time: DateFormat("hh:mm a").format(time),
                                  ),
                                );
                              },
                            );
                    },
                  ));
                },
              ),

            //..................

            if (selectedItem == 'Pending')
              ValueListenableBuilder(
                valueListenable: dateRangeNotifier,
                builder: (context, dateRange, child) {
                  return Expanded(
                      child: ValueListenableBuilder<Box<MedicinesAdd>>(
                    valueListenable: MedicinesAdd.getdata().listenable(),
                    builder: (context, box, _) {
                      var dataList = box.values.toList().cast<MedicinesAdd>();
                      //
                      List<MedicinesAdd> dateFilteredList = [];
                      if (dateRange != null) {
                        for (var element in dataList) {
                          if (element.date.isAfter(dateRange.start
                                  .subtract(const Duration(days: 1))) &&
                              element.date.isBefore(
                                  dateRange.end.add(const Duration(days: 1)))) {
                            dateFilteredList.add(element);
                          }
                        }
                        dataList = dateFilteredList;
                      }
                      return dataList.isEmpty
                          ? Center(
                              child:
                                  Image.asset('lib/assets/images/no_data.gif'),
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
                                  child: MedicineCardWidget(
                                    date:
                                        DateFormat("MMMM d").format(data!.date),
                                    medicine: data.medicinename,
                                    reason: data.reason,
                                    time: DateFormat("hh:mm a")
                                        .format(data.medTime),
                                  ),
                                );
                              },
                            );
                    },
                  ));
                },
              )
          ]),
        ),
      )),
    );
  }
}
