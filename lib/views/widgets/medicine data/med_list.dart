import 'dart:developer';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';
import 'package:water_reminder/provider/medicine_provider.dart';
import '../../dialogs/notification/notification.dart';

class MedList extends StatefulWidget {
  const MedList({super.key});

  @override
  State<MedList> createState() => _MedListState();
}

class _MedListState extends State<MedList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MedicineProvider>(
      builder: (context, medicineProvider, _) {
        // to convert data to list
        final box = medicineProvider.box;
        var data = box.values.toList();
        return data.isEmpty
            ? _buildEmptyState()
            : ListView.builder(
                itemCount: box.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      GestureDetector(
                       onLongPressStart: (direction) {
                          showMedAlert(context, index, data);
                          context.read<MedicineProvider>().box;
                        },
                        key: UniqueKey(),
                        child: BlurryContainer(
                          width: double.infinity,
                          height: 110.h,
                          color: Colors.white,
                          elevation: 3,
                          blur: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Stack(
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                                            data[index].medTime.toString()),
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
                                              onConfirmBtnTap: () {
                                                data[index].isCompleted = true;
                                                // here we are deleting and storing
                                                // the data when user click on check box
                                                // it marked has completed medicine
                                                // and we will delete that data and store to
                                                // another filed called MedCompleted the reason
                                                // we are storing the data because we want to
                                                // show the completed data in history
                                                context
                                                    .read<MedicineProvider>()
                                                    .medCompleted(
                                                        medicineName:
                                                            data[index]
                                                                .medicinename,
                                                        reason:
                                                            data[index].reason,
                                                        category: data[index]
                                                            .category,
                                                        medTime:
                                                            data[index].medTime,
                                                        medDate:
                                                            data[index].date);

                                                box.deleteAt(index);
                                                Navigator.of(context).pop();
                                              },
                                              context: context,
                                              type: QuickAlertType.confirm,
                                              title:
                                                  'Are you sure you complete Medicine?',
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
