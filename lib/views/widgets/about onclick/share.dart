import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

Future<void> shareApp() async {
  await Share.share(
    'Check out this awesome app!',
    subject: 'App recommendation',
    sharePositionOrigin: const Rect.fromLTWH(0, 0, 100, 100),
  );
}
