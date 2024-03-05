import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/BlurryContainer.dart';

class MedicineCardWidget extends StatelessWidget {
  final String medicine;
  final String reason;
  final String time;
  final String date;

  const MedicineCardWidget(
      {super.key,
      required this.date,
      required this.medicine,
      required this.reason,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return BlurryContainer(
      borderRadius: BorderRadius.circular(30),
      color: Colors.green.withOpacity(0.5),
      height: 60.h,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      blur: 1,
      elevation: 2,
      child: Stack(
        children: [
          Positioned(
            top: 0,
          left: 0,
            child: Text(
              'Medicine: $medicine',
              style: const TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
          Positioned(
            bottom: 0,
            left:0,
            child: Text('Reason: $reason',
                style: const TextStyle(fontSize: 15, color: Colors.white)),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Text(date,
                style: const TextStyle(fontSize: 15, color: Colors.white)),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Text(time,
                style: const TextStyle(fontSize: 15, color: Colors.white)),
          )
        ],
      ),
    );
  }
}



// ListTile(
//                                           title: Text(
//                                               'Medicine: ${data!.medicinename}',
//                                               style: const TextStyle(
//                                                   fontSize: 18,
//                                                   color: Colors.white)),
//                                           subtitle: Text(
//                                               'Reason: ${data.reason}',
//                                               style: const TextStyle(
//                                                   fontSize: 18,
//                                                   color: Colors.white)),
//                                           trailing: Column(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceEvenly,
//                                             children: [
//                                               Text(data.medTime.toString(),
//                                                   style: const TextStyle(
//                                                       fontSize: 15,
//                                                       color: Colors.white)),
//                                               Text(
//                                                   DateFormat("MMMM d")
//                                                       .format(data.date),
//                                                   style: const TextStyle(
//                                                       fontSize: 15,
//                                                       color: Colors.white)),
//                                             ],
//                                           ),
//                                         ),