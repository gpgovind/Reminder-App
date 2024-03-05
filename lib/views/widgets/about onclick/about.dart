import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text('About'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Water Reminder',
                style: TextStyle(fontSize: 20.sp),
              ),
              Text(
                'Developed By Govind',
                style: TextStyle(fontSize: 18.sp),
              ),
              Text(
                'Version 1.0',
                style: TextStyle(fontSize: 15.sp),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
