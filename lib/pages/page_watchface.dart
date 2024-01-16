import 'package:flutter/material.dart';
import 'package:watchlauncher/clock_widget/WatchFaceAnalog01/wf_analog_01.dart';
import 'package:watchlauncher/clock_widget/WatchFaceDigital01/wf_digital_01.dart';

class PageWatchFace extends StatefulWidget {
  const PageWatchFace({super.key});

  @override
  State<PageWatchFace> createState() => _PageWatchFaceState();
}

List<Widget> watchFaceList = [
  const WatchFaceDigital01(mycolor: Colors.blue),
  const WatchFaceAnalog01()
];

class _PageWatchFaceState extends State<PageWatchFace> {
  @override
  Widget build(BuildContext context) {
    // return const WatchFaceDigital01(mycolor: Colors.blue);
    return watchFaceList[1];
  }
}
