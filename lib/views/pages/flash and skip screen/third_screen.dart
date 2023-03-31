import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:water_reminder/views/widgets/number%20picker/numberpicker.dart';

// import '../number_picker/Numberpicker.dart';

class ThirdSkip extends StatelessWidget {
  const ThirdSkip({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        // color: Color.fromRGBO(239, 243, 254, 1),
        image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('lib/assets/images/gradientbb.gif')),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                Flexible(
                  child: Container(
                    width: 400.w,
                    height: 300.h,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        alignment: Alignment.topCenter,
                        image: AssetImage("lib/assets/images/rafiki.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  'Select your goal',
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontFamily: AutofillHints.impp,
                      fontWeight: FontWeight.bold),
                ),
                const Expanded(child: GoalNumberPicker())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
