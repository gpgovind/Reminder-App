import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../dialogs/notification/notification.dart';
import '../../widgets/about onclick/about.dart';
import '../../widgets/about onclick/feedback.dart';
import '../../widgets/about onclick/reset.dart';
import '../../widgets/about onclick/share.dart';
import '../../widgets/goal edit/goal_edit.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
                centerTitle: true,
                title: Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.count(
                  childAspectRatio: (150 / 130),
                  crossAxisSpacing: 13,
                  mainAxisSpacing: 15,
                  crossAxisCount: 2,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AboutScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 20.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [Icon(Icons.info), Text('About')],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        feedBack();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 20.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.feedback),
                          Text('Feedback')
                        ],
                      ),
                    ),
                    // ElevatedButton(
                    //   onPressed: () {},
                    //   style: ElevatedButton.styleFrom(
                    //     backgroundColor: Colors.white,
                    //     padding: const EdgeInsets.symmetric(
                    //         horizontal: 40.0, vertical: 20.0),
                    //     shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(30.0)),
                    //   ),
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: const [
                    //       Icon(Icons.privacy_tip),
                    //       Text('Privacy Policy')
                    //     ],
                    //   ),
                    // ),
                    ElevatedButton(
                      onPressed: () {
                        showAlertReset(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 20.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.restore,
                            color: Colors.red,
                          ),
                          Text('Reset')
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: shareApp,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 20.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.share,
                            color: Colors.blue,
                          ),
                          Text('Share')
                        ],
                      ),
                    ),
                    const GoalEdit()
                  ],
                ),
              ))),
    );
  }
}
