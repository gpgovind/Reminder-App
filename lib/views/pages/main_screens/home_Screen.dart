
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:water_reminder/consts/color.dart';
import '../../../provider/water_provider.dart';
import '../../dialogs/notification/notification.dart';
import '../../widgets/animated icon.dart/animatd_icon1.dart';
import '../../widgets/water screen data/water_listview_builder.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:percent_indicator/percent_indicator.dart';

// ValueNotifier<double>  = ValueNotifier<double>(0);

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
@override
  void initState() {
    // TODO: implement initState
    context.read<WaterProvider>().waterGetData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 200,
              width: 200,
              alignment: Alignment.center,
              child: Consumer<WaterProvider>(builder: (context, value, child) {
                return (value.getIndicatorValue() > 0.95)
                    ? const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Icon(
                              Icons.check_circle_outline,
                              color: Colors.green,
                              size: 50,
                            ),
                          ),
                          SizedBox(height: 10),
                          Center(
                            child: Text(
                              'Congratulations, you reached your goal!',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ],
                      )
                    : CircularPercentIndicator(
                        backgroundColor: indicatorBackgroundColor,
                        progressColor: progressColor,
                        animation: true,
                        animationDuration: 1200,
                        radius: 99.0,
                        lineWidth: 10,
                        percent: value.getIndicatorValue(),
                        center: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Your Goal',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Text(
                              "${WaterProvider().displayGoal().toString()} ml",
                              style: TextStyle(
                                  fontSize: 17.sp, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                          ],
                        ),
                      );
              }),
            ),
          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: BlurryContainer(
                    blur: 5,
                    width: 360,
                    height: 40,
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.blue.withOpacity(0.1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          alignment: Alignment.centerRight,
                          width: 280,
                          height: 40,
                          child: Center(
                            child: AnimatedTextKit(
                                pause: const Duration(seconds: 3),
                                repeatForever: true,
                                isRepeatingAnimation: true,
                                animatedTexts: [
                                  TyperAnimatedText(
                                      'Stay refreshed and energized',
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16)),
                                  TyperAnimatedText(
                                      'Stay on track with medicine',
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16)),
                                  TyperAnimatedText('Drink more water',
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16)),
                                  TyperAnimatedText('Keep yourself hydrated',
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16)),
                                  TyperAnimatedText('Water is important',
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16)),
                                  TyperAnimatedText(
                                      'Stay healthy, take your medicine.',
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16)),
                                  TyperAnimatedText('Thirsty? Drink up!',
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16)),
                                  TyperAnimatedText('Add medicine',
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16)),
                                  TyperAnimatedText('Drink up, stay cool.',
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16)),
                                  TyperAnimatedText(
                                      'Health starts with hydration',
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16)),
                                  TyperAnimatedText(
                                      "Don't forget to add drink ",
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16))
                                ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: BlurryContainer(
                  width: 60,
                  height: 60,
                  elevation: 4,
                  blur: 4,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  child: Center(
                    child: AnimatedIcon1(
                      key: UniqueKey(),
                      icon1: const Icon(
                        Icons.add,
                        color: Colors.blue,
                      ),
                      icon2: const Icon(
                        Icons.add_alert,
                        color: Color(0xFF35BAFF),
                      ),
                      onPressed: () async {
                        await waterAddShow(context);
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 7.h,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60, right: 30),
                child: ListTile(
                  leading: Text(
                    "Today's Records",
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
          const Expanded(child: WaterListView()),
        ],
      ),
    );
  }
}
