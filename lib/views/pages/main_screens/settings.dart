import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_background_image.dart';
import '../../dialogs/notification/notification.dart';
import '../../widgets/about onclick/about.dart';
import '../../widgets/about onclick/feedback.dart';
import '../../widgets/about onclick/reset.dart';
import '../../widgets/about onclick/share.dart';
import '../../widgets/setting_tile_widget.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
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
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
          child: Column(
            children: [
              SizedBox(
                height: 20.0.h,
              ),
              SettingsTileWidget(
                data: 'About',
                icon: Icons.info,
                color: Colors.green,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AboutScreen()));
                },
              ),
              SettingsTileWidget(
                data: 'Feedback',
                icon: Icons.feedback,
                color: Colors.blue, // Choose the appropriate color
                onTap: () {
                  feedBack();
                },
              ),
              SettingsTileWidget(
                data: 'Reset',
                icon: Icons.restore,
                color: Colors.red, // Choose the appropriate color
                onTap: () {
                  showAlertReset(context);
                },
              ),
              SettingsTileWidget(
                data: 'Share',
                icon: Icons.share,
                color: Colors.blue, // Choose the appropriate color
                onTap: () {
                  shareApp();
                },
              ),
              SettingsTileWidget(
                data: 'Edit Goal',
                icon: Icons.edit,
                color: Colors.orange, // Choose the appropriate color
                onTap: () {
                  goalEdit(context);
                },
              )
            ],
          ),
        ),
      )),
    );
  }
}
