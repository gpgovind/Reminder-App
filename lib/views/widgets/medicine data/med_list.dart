import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../controller/medicine_provider.dart';
import '../../dialogs/notification/notification.dart';
import 'med_card.dart';

class MedList extends StatefulWidget {
  const MedList({super.key});

  @override
  State<MedList> createState() => _MedListState();
}

class _MedListState extends State<MedList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MedicineController>(
      builder: (context, medicineProvider, _) {
        // to convert data to list
        final box = medicineProvider.box;
        var data = box.values.toList();
        return data.isEmpty
            ? _buildEmptyState()
            : ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                      height: 7,
                    ),
                itemCount: box.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 3, horizontal: 3),
                    child: GestureDetector(
                        onLongPressStart: (direction) {
                          showMedAlert(context, index, data);
                          context.read<MedicineController>().box;
                          log(index.toString());
                        },
                        key: UniqueKey(),
                        child: MedCard(
                          index: index,
                          box: box,
                          data: data,
                        )),
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
