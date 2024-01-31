import 'package:flutter/material.dart';
import 'package:watch_launcher/clock_widget/WatchFaceAnalog01/wf_analog_01.dart';
import 'package:watch_launcher/clock_widget/WatchFaceAnalog02/wf_analog_02.dart';
import 'package:watch_launcher/clock_widget/WatchFaceDigital02/wf_digital_02.dart';
import 'package:watch_launcher/model/watchface_manager/watchface_selection.dart';

List<Widget> createWatchFaceList() {
  List<Widget> pages = [];
  pages = [
    const WatchFaceAnalog02(),
    const WatchFaceDigital02(mycolor: Colors.green),
    const WatchFaceAnalog01(),
  ];
  return pages;
}

List<Widget> createWatchFaceSelection(List<Widget> watchFaceList) {
  final List<Widget> pages = watchFaceList.asMap().entries.map((entry) {
    final int idx = entry.key;
    final Widget watchFace = entry.value;

    return WatchFaceSelection(
      mywidget: watchFace,
      idWatch: idx,
    );
  }).toList();

  return pages;
}
