import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_background_image.dart';
import 'home_Screen.dart';
import 'medicine_Screen.dart';

class TabScreens extends StatefulWidget {
  const TabScreens({
    super.key,
  });

  @override
  State<TabScreens> createState() => _TabScreensState();
}

class _TabScreensState extends State<TabScreens> {
  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      child: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            extendBody: true,
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              toolbarHeight: 80.h,
              title: Card(
                elevation: 3,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18)),
                  child: TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorWeight: 0.1,
                    indicator: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(13), // Creates border
                        color: const Color(0xFF64CAFF)),
                    tabs: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 5),
                        child: Tab(
                          icon: Row(
                            children: [
                              Image.asset(
                                'lib/assets/images/drink-water.png',
                                height: 35.h,
                                width: 50.w,
                              ),
                              Text(
                                'Water',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.sp),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 5),
                        child: Tab(
                          icon: Row(
                            children: [
                              Image.asset(
                                'lib/assets/images/drug.png',
                                height: 35.h,
                                width: 50.h,
                              ),
                              Text(
                                'Medicine',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.sp),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            body: const Padding(
                padding: EdgeInsets.all(8.0),
                child: TabBarView(children: [HomeScreen(), MedicineScreen()])),
          ),
        ),
      ),
    );
  }
}
