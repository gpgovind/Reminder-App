import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecondSkip extends StatelessWidget {
  const SecondSkip({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        // color: Color.fromRGBO(239, 243, 254, 1),
        image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('lib/assets/images/gradientbb.gif')),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
            child: Column(
              children: [
                SizedBox(
                    width: 400.w,
                    height: 300.h,
                    child: Image.asset(
                        'lib/assets/images/7122331-removebg-preview.png')),
                SizedBox(
                  height: 40.h,
                ),
                Column(
                  children: [
                    Text(
                      'water helps your body  remove waste',
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: AutofillHints.impp,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      ' and helps in indigestion ,prevents',
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: AutofillHints.impp,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '  you from becoming dehydrated',
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: AutofillHints.impp,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
