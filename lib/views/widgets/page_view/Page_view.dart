import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:water_reminder/models/hive_services/data_model.dart';
import '../../pages/flash and skip screen/second_screen.dart';
import '../../pages/flash and skip screen/third_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../botttom nav/botttom_nav.dart';
import 'error message for goal/confrom_goal.dart';

class Pageview extends StatefulWidget {
  const Pageview({super.key});

  @override
  State<Pageview> createState() => _PageviewState();
}

class _PageviewState extends State<Pageview> {
  //controller to keep track of which page we
  PageController controller = PageController();
  bool onLastPage = false;
  bool onLastSkip = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      body: Stack(
        children: [
          PageView(
            controller: controller,
            onPageChanged: (index) {
              if (index == 1) {
                setState(() {
                  onLastSkip = true;
                });
              }
              setState(() {
                onLastPage = (index == 1);
              });
            },
            children: const [
              SecondSkip(),
              ThirdSkip(),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 30.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ListTile(
                  title: Padding(
                    padding: EdgeInsets.only(left: 35.w),
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 2,
                      effect: const WormEffect(
                          strokeWidth: 2.4,
                          activeDotColor: Colors.blue,
                          dotWidth: 20,
                          dotHeight: 10,
                          dotColor: Color(0xFFA5CEEF),
                          spacing: 10),
                    ),
                  ),
                  trailing: onLastPage
                      ? GestureDetector(
                          child: ElevatedButton(
                              onPressed: () {
                                if (Watergoal.getdata().values.isEmpty) {
                                  log('enter goal');
                                  showAlertForGoal(context);
                                } else {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const BottomNav()));
                                }
                              },
                              child: const Text('Get Started')),
                        )
                      : GestureDetector(
                          child: ElevatedButton(
                              onPressed: () {
                                controller.nextPage(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeIn);
                              },
                              child: const Text('Next')),
                        ),
                ),

                //
              ],
            ),
          )
        ],
      ),
    );
  }
}
