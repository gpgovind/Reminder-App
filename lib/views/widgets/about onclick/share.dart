import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

Future<void> shareApp() async {
  await Share.share(
    'Check out this awesome app!',
    subject: 'App recommendation',
    sharePositionOrigin: Rect.fromLTWH(0, 0, 100, 100),
  );
}


// flutter_icons:
//   image_path: "lib/assets/images/water  app _logo.png"
//   android: true
//   ios: true 
//   adaptive_icon_background: "#ffffff"
//   adaptive_icon_foreground: "lib/assets/images/water  app _logo.png"