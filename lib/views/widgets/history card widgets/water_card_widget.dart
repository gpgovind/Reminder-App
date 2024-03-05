import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/BlurryContainer.dart';

class HistoryCardWidget extends StatelessWidget {
  final String water;
  final String time;
  final String date;
  const HistoryCardWidget({
    super.key,
    required this.date,
    required this.time,
    required this.water,
  });

  @override
  Widget build(BuildContext context) {
    return BlurryContainer(
      borderRadius: BorderRadius.circular(30),
      color: const Color.fromRGBO(53, 186, 255, 1).withOpacity(0.8),
      height: 60.h,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      blur: 1,
      elevation: 2,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Text(
              time,
              style: const TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
          Positioned(
            top: 0,
            child: Text('$water ml',
                style: const TextStyle(fontSize: 15, color: Colors.white)),
          ),
          Positioned(
            bottom: 10,
            right: 0,
            child: Text(date,
                style: const TextStyle(fontSize: 15, color: Colors.white)),
          )
        ],
      ),
    );
  }
}


// ListTile(
//           title: Text(water,
//               style: const TextStyle(fontSize: 18, color: Colors.white)),
   
    
