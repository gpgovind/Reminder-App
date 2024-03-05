import 'dart:developer';

import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';

import '../../../controller/medicine_provider.dart';
import '../../../models/hive_services/data_model.dart';
import '../../../utils/BlurryContainer.dart';

class MedCard extends StatelessWidget {
  final List<MedicinesAdd> data;
  final Box<MedicinesAdd> box;
  final int index;
  const MedCard(
      {super.key, required this.data, required this.index, required this.box});

  @override
  Widget build(BuildContext context) {
    return BlurryContainer(
      width: double.infinity,
      height: 110.h,
      color: Colors.white,
      elevation: 3,
      borderRadius: BorderRadius.circular(18),
      blur: 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Medicine: ${data[index].medicinename}',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 15.sp,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Reason: ${data[index].reason}',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 15.sp,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Category: ${data[index].category}',
                    style: TextStyle(
                      color: const Color(0xff9b59b6),
                      fontSize: 15.sp,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      DateFormat("hh:mm a").format(data[index].medTime),
                      style: TextStyle(
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Checkbox(
                    value: data[index].isCompleted,
                    onChanged: (value) {
                      if (value!) {
                        log('chekbox is taped');

                        QuickAlert.show(
                          onCancelBtnTap: () {
                            data[index].isCompleted = false;
                            Navigator.of(context).pop();
                          },
                          onConfirmBtnTap: () async {
                            data[index].isCompleted = true;
                            // here we are deleting and storing
                            // the data when user click on check box
                            // it marked has completed medicine
                            // and we will delete that data and store to
                            // another filed called MedCompleted the reason
                            // we are storing the data because we want to
                            // show the completed data in history
                            await Alarm.stop(index).then((value) async {
                              context
                                  .read<MedicineController>()
                                  .medicineCompleted(
                                      medicineName: data[index].medicinename,
                                      reason: data[index].reason,
                                      category: data[index].category,
                                      medTime: data[index].medTime.toString(),
                                      date: data[index].date);

                              await box.deleteAt(index).then((value) {
                                Navigator.of(context).pop();
                              });
                            });
                          },
                          context: context,
                          type: QuickAlertType.confirm,
                          title: 'Are you sure you complete Medicine?',
                        );
                      } else {
                        data[index].isCompleted = false;
                      }
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    DateFormat("MMMM d").format(data[index].date),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.sp,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
