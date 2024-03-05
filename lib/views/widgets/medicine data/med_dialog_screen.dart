import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:updated_water_app/consts/Textformfield.dart';
import 'package:updated_water_app/utils/app_background_image.dart';

import '../../../consts/timepicker.dart';
import '../../../controller/medicine_provider.dart';
import '../../dialogs/notification/notification.dart';
import '../alarm/alarm.dart';
import '../datepicker/data_picker.dart';
import 'med_button.dart';
import 'select_med_category.dart';

class MedDialogScreen extends StatefulWidget {
  const MedDialogScreen({super.key});

  @override
  State<MedDialogScreen> createState() => _MedDialogScreenState();
}

class _MedDialogScreenState extends State<MedDialogScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController medController = TextEditingController();
  TextEditingController reasonController = TextEditingController();

  bool isTimeSelected = false;
  bool isDateSelected = false;
  String medCategory = 'Capsule';
  late DateTime selectedDate;
  late DateTime selectedTime;

  @override
  void dispose() {
    medController.dispose();
    reasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      child: SafeArea(
          child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text(
            'Add Medicine',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: ListView(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter medicine';
                          }
                          return null;
                        },
                        hintText: 'Enter Medicine',
                        controller: medController),
                    CustomTextField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter reason';
                          }
                          return null;
                        },
                        hintText: 'Enter Reason',
                        controller: reasonController),
                  ],
                ),
              ),
              SelectMedCategory(
                category: (selectedCategory) {
                  medCategory = selectedCategory;
                  log(medCategory);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TimePicker(
                    onTimeSelected: (time) {
                      isTimeSelected = true;
                      selectedTime = time;
                    },
                  ),
                  Dateselector(
                    dateTime: (date) {
                      isDateSelected = true;
                      selectedDate = date;
                    },
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              MedButton(
                data: 'Confirm',
                onTap: () async {
                  try {
                    if (_formKey.currentState!.validate() &&
                        isDateSelected &&
                        isTimeSelected) {
                      EasyLoading.show(
                          dismissOnTap: true, status: 'please wait');
                      await context
                          .read<MedicineController>()
                          .medicineAdd(
                              medController: medController.text,
                              date: selectedDate,
                              medTime: selectedTime,
                              reasonController: reasonController.text,
                              categoryController: medCategory)
                          .then((value) async {
                        MedicineController medicineProvider =
                            MedicineController();
                        final box = medicineProvider.box;
                        var storedData = box.values.toList();
                        try {
                          log("${storedData.length} list length");
                          await setAlarm(
                                  id: storedData.length - 1,
                                  notificationBody: storedData.last.category,
                                  notificationTitle:
                                      storedData.last.medicinename,
                                  dateTime: storedData.last.medTime)
                              .then((result) {
                            log(result.toString());
                            EasyLoading.dismiss();
                            Navigator.pop(context);
                          });
                        } catch (e) {
                          log('alarm failed ');
                          EasyLoading.showInfo('Failed To Set Notification');
                          Navigator.pop(context);
                        }
                      });

                      // Retrieve stored time from Hive

                      // if (storedData.isNotEmpty) {
                      //   log('called');

                      //   // // Schedule alarm

                      // }
                    } else {
                      showFlushBar(context, 'please select time and Date');
                    }
                  } catch (e) {
                    // log(e.toString());
                  }
                },
              ),
              MedButton(
                data: 'Cancel',
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}
