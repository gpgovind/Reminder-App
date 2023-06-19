import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../dialogs/notification/notification.dart';
import '../../widgets/about onclick/about.dart';
import '../../widgets/about onclick/feedback.dart';
import '../../widgets/about onclick/reset.dart';
import '../../widgets/about onclick/share.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

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
            child: Column(
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AboutScreen()));
                  },
                  child: BlurryContainer(
                    width: double.infinity,
                    height: 70.h,
                    color: Colors.transparent,
                    elevation: 3,
                      blur: 200.0,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon(Icons.info), Text('About')],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                BlurryContainer(
                 width: double.infinity,
                    height: 70.h,
                    color: Colors.transparent,
                    elevation: 3,
                    blur: 200.0,
                  child: ListTile(
                    onTap: () {
                      feedBack();
                    },
                    title: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon(Icons.feedback), Text('Feedback')],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                BlurryContainer(
               width: double.infinity,
                    height: 70.h,
                    color: Colors.transparent,
                    elevation: 3,
                     blur: 200.0,
                  child: ListTile(
                    onTap: () {
                      showAlertReset(context);
                    },
                    title: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.restore,
                          color: Colors.red,
                        ),
                        Text('Reset')
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                BlurryContainer(
                  width: double.infinity,
                    height: 70.h,
                    color: Colors.transparent,
                    elevation: 3,
                    blur: 200.0,
                  child: const ListTile(
                    onTap: shareApp,
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.share,
                          color: Colors.blue,
                        ),
                        Text('Share')
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                BlurryContainer(
                width: double.infinity,
                    height: 70.h,
                    color: Colors.transparent,
                    elevation: 3,
                   blur: 200.0,
                  child: ListTile(
                    onTap: () {
                      goalEdit(context);
                    },
                    title: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.edit,
                          color: Colors.blue,
                        ),
                        Text('Edit goal'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )));
  }
}
