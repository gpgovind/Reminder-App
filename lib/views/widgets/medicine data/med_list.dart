import 'dart:developer';

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:quickalert/quickalert.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:water_reminder/views/widgets/about%20onclick/reset.dart';
import '../../../models/hive_services/data_model.dart';
import '../../dialogs/notification/notification.dart';


class MedList extends StatefulWidget {
  const MedList({super.key});

  @override
  State<MedList> createState() => _MedListState();
}

class _MedListState extends State<MedList> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<MedicinesAdd>>(
      valueListenable: MedicinesAdd.getdata().listenable(),
      builder: (context, box, _) {
        // to convert data to list
        var data = box.values.toList();
        return data.isEmpty
            ? _buildEmptyState()
            : ListView.builder(
                itemCount: box.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Dismissible(
                        onDismissed: (direction) async {
                          // Remove the item from the list

                        showAlert(context,index);
                        },
                        key: UniqueKey(),
                        child: BlurryContainer(
                          width: double.infinity,
                          height: 110.h,
                          color:Colors.white,
                          elevation: 3,
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
                             ],),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Align(
                                        alignment: Alignment.bottomRight,
                                        child:
                                            Text(data[index].medTime.toString()),
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
                                                Navigator.of(context).pop();
                                                setState(()  {
                                                  data[index].isCompleted = false;
                                                });
                                              },
                                              onConfirmBtnTap: () {
                                                Navigator.of(context).pop();
                                                setState(() {
                                                  data[index].isCompleted = true;
                                                  // here we are deleting and storing 
                                                  // the data when user click on check box
                                                  // it marked has completed medicine 
                                                  // and we will delete that data and store to
                                                  // another filed called MedCompleted the reason 
                                                  // we are storing the data because we want to 
                                                  // show the completed data in history 
                                                  MedCompleted med = MedCompleted(
                                                    data[index].medicinename,
                                                    data[index].reason,
                                                    data[index].category,
                                                    data[index].medTime,
                                                    data[index].date,
                                                  );
                                                  MedCompleted.getdata().add(med);
                                                  med.save();
                          
                                                  box.deleteAt(index);
                                                });
                                              },
                                              context: context,
                                              type: QuickAlertType.confirm,
                                              title:
                                                  'Are you sure you complete Medicine?',
                                            );
                                          } else {
                                            setState(() {
                                              data[index].isCompleted = false;
                                            });
                                          }
                                        },
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        DateFormat("MMMM d")
                                            .format(data[index].date),
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
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                    ],
                  );
                });
      },
    );
  }

  Widget _buildEmptyState() {
    //  if there is no data on that current date it wil show this image
    return Image.asset(
      'lib/assets/images/output-onlinegiftools(4).gif',
      width: 350.w,
      height: 230.h,
    );
  }
}
