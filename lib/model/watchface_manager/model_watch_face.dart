import 'package:flutter/material.dart';
import 'package:watch_launcher/clock_widget/WatchFaceAnalog01/wf_analog_01.dart';
import 'package:watch_launcher/clock_widget/WatchFaceAnalog02/wf_analog_02.dart';
import 'package:watch_launcher/clock_widget/WatchFaceDigital02/wf_digital_02.dart';

List<Widget> createWatchFaceList() {
  List<Widget> pages = [];
  pages = [
    const WatchFaceAnalog02(),
    const WatchFaceDigital02(mycolor: Colors.green),
    const WatchFaceAnalog01(),
  ];
  return pages;
}
