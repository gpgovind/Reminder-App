import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:flutter_flushbar/flutter_flushbar.dart';

import '../../../models/hive_services/data_functions.dart';
import '../../../models/hive_services/data_model.dart';
import '../../widgets/number picker/drink_numberpicker.dart';
import '../../widgets/number picker/numberpicker.dart';
import '../../widgets/water screen data/grap_notifier_function.dart';

showAlert(
  BuildContext context,
  int index,
) {
  QuickAlert.show(
      context: context,
      type: QuickAlertType.confirm,
      title: 'Are you sure you want to delete',
      onConfirmBtnTap: () async {
        await MedicinesAdd.getdata().deleteAt(index);
      });
}

zeroNotAllowedAlert(
  BuildContext context,
) {
  QuickAlert.show(
    context: context,
    type: QuickAlertType.warning,
    title: "0 Zero Not Allowed",
  );
}

waterAddShow(BuildContext context) {
  QuickAlert.show(
    borderRadius: 30,
    customAsset: 'lib/assets/images/output-onlinegiftools(2).gif',
    animType: QuickAlertAnimType.slideInDown,
    widget: const AddWaterNUmberPicker(),
    onConfirmBtnTap: () async {
      if (waterAdd.value == 0) {
        zeroNotAllowedAlert(context);
      } else {
        await addWater();
        grap(Drinkbox.getdata(), DateTime.now());
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
      }
    },
    context: context,
    type: QuickAlertType.confirm,
    title: '',
   
  );
}

void showFlushBar(BuildContext context) {
  Flushbar(
    animationDuration: const Duration(milliseconds: 900),
    icon: const Icon(Icons.check_circle, color: Colors.white),
    shouldIconPulse: false,
    duration: const Duration(seconds: 1),
    padding: const EdgeInsets.all(15),
    flushbarPosition: FlushbarPosition.TOP,
    margin: const EdgeInsets.all(20),
    borderRadius: const BorderRadius.all(Radius.circular(24)),
    backgroundGradient: const LinearGradient(
        colors: [Color(0xFFF21852), Color(0xFFF39821)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter),
    message: 'Success',
  ).show(context).then((value) => null);
}
//  final Color mdColor=Color(#FF0076 as int);

goalEdit(BuildContext context) {
  QuickAlert.show(
    customAsset: 'lib/assets/images/water goal.gif',
    widget: const GoalNumberPicker(),
    onConfirmBtnTap: () async {
      Navigator.pop(context);
    },
    context: context,
    type: QuickAlertType.confirm,
    title: '',
  );
}
