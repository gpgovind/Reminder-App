import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:water_reminder/models/hive_services/data_functions.dart';
import '../../../consts/Textformfield.dart';
import '../../../consts/timepicker.dart';
import '../datepicker/data_picker.dart';
import '../../dialogs/notification/notification.dart';

class MedFormShowDialog extends StatefulWidget {
  const MedFormShowDialog({Key? key}) : super(key: key);

  @override
  State<MedFormShowDialog> createState() => _MedFormShowDialogState();
}

class _MedFormShowDialogState extends State<MedFormShowDialog> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController medController = TextEditingController();

  TextEditingController reasonController = TextEditingController();

  TextEditingController categoryController = TextEditingController();

  Future<void> showMyDialog() async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            primary: Paint.enableDithering,
            child: SizedBox(
              width: 350.w,
              height: 350.h,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormFieldRewrite(
                      controller: medController,
                      hintText: 'enter medicine name',
                    ),
                    TextFormFieldRewrite(
                      controller: categoryController,
                      hintText: 'enter capsule or tablet ',
                    ),
                    TextFormFieldRewrite(
                      controller: reasonController,
                      hintText: 'enter reason',
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [TimePicker(), Dateselector()],
                    )
                  ],
                ),
              ),
            ),
          ),
          title: const Text(
            'Add Medicine',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          actions: [
            Row(
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.done),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pop(context);

                      // here we are calling this function to store medicine data into database

                      medAdd(
                          medController: medController,
                          date: date,
                          medTime: medTime,
                          reasonController: reasonController,
                          categoryController: categoryController);
                      // If the form is valid, display a snackbar,

                      showFlushBar(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                  },
                  label: const Text('done'),
                ),
                const Spacer(
                  flex: 4,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.cancel),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    label: const Text('cancel'),
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
              ],
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: showMyDialog,
      child: const Icon(Icons.add),
    );
  }
}
