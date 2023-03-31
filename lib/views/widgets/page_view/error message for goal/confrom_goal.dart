import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

void showAlertForGoal(BuildContext context) {
  QuickAlert.show(
    text: ' conform that you selected your goal',
    title: 'Select Your Goal',
    context: context, type: QuickAlertType.error);
}