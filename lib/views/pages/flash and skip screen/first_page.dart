import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:water_reminder/models/hive_services/data_model.dart';

import '../../widgets/botttom nav/botttom_nav.dart';
import '../../widgets/page_view/Page_view.dart';

class FlashScreen extends StatefulWidget {
  const FlashScreen({super.key});

  @override
  State<FlashScreen> createState() => _FlashScreenState();
}

class _FlashScreenState extends State<FlashScreen> {
  @override

  void initState() {
    
    Watergoal.getdata().values.isEmpty? const Pageview() :const BottomNav();
     
    super.initState();
  }
  Widget build(BuildContext context) {
    return Container(
       decoration: const BoxDecoration(
        // color: Color.fromRGBO(239, 243, 254, 1),
        image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('lib/assets/images/gradientbb.gif')),
      ),
      child: AnimatedSplashScreen(
        splashIconSize: 350,
        backgroundColor: Colors.transparent,
        splash: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Image.asset(
              'lib/assets/images/water_logo-removebg-preview.png',
              height: 200.h,
              width: 400.w,
            ),
          ),
        ),
        splashTransition: SplashTransition.sizeTransition,
        duration: 3000,
        nextScreen:  Watergoal.getdata().values.isEmpty? const Pageview() :const BottomNav(),
     
      ),
    );
  }
}
