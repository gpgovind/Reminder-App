import 'dart:developer';

import 'package:url_launcher/url_launcher.dart';

Future<void> feedBack() async {
  const url =
      'mailto:gpgovind887@gmail.com?subject=Review on water App &body= Can you help me';
  try {
    Uri uri = Uri.parse(url);
    await launchUrl(uri);
    log("");
  } catch (e) {
    log("error");
  }
}
