import 'package:flutter/material.dart';
import 'package:watch_launcher/clock_widget/WatchFaceAnalog02/wf_analog_02.dart';
import 'package:watch_launcher/pages/page_watchface_list.dart';

import '../clock_widget/WatchFaceAnalog01/wf_analog_01.dart';
import '../clock_widget/WatchFaceDigital01/wf_digital_01.dart';

class PageWatchFace extends StatefulWidget {
  const PageWatchFace({super.key});

  @override
  State<PageWatchFace> createState() => _PageWatchFaceState();
}

List<Widget> demoWatchFaceList = [
  const WatchFaceDigital01(mycolor: Colors.blue),
  const WatchFaceAnalog01(),
  const WatchFaceAnalog02()
];

Widget currentWatchFace = demoWatchFaceList[1];

class _PageWatchFaceState extends State<PageWatchFace> {
  void updateWatchFace(Widget newWatchface) {
    setState(() {
      currentWatchFace = newWatchface;
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    // return const WatchFaceDigital01(mycolor: Colors.blue);
    return GestureDetector(
        onLongPress: () {
          // Handle long press here
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PageWatchFaceList(
                      updateWatchFace: updateWatchFace,
                    )),
          );
        },
        child: currentWatchFace);
  }
}
