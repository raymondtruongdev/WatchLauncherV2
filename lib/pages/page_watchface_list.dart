// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:loop_page_view/loop_page_view.dart';
import 'package:watch_launcher/clock_widget/WatchFaceAnalog01/wf_analog_01.dart';
import 'package:watch_launcher/clock_widget/WatchFaceAnalog02/wf_analog_02.dart';
import 'package:watch_launcher/clock_widget/WatchFaceDigital01/wf_digital_01.dart';
import 'package:watch_launcher/clock_widget/WatchFaceDigital02/wf_digital_02.dart';
import 'package:watch_launcher/clock_widget/watchface_selection.dart';

class PageWatchFaceList extends StatefulWidget {
  final Function updateWatchFace;

  const PageWatchFaceList({Key? key, required this.updateWatchFace})
      : super(key: key);

  @override
  _PageWatchFaceListState createState() => _PageWatchFaceListState();
}

class _PageWatchFaceListState extends State<PageWatchFaceList> {
  List<Widget> pages = [];

  @override
  void initState() {
    super.initState();
    createWatchFaceList();
  }

  void createWatchFaceList() {
    pages = [
      WatchFaceSelection(
          mywidget: const WatchFaceAnalog02(), onPressed: chosseNewWatchFace),
      WatchFaceSelection(
          mywidget: const WatchFaceDigital02(mycolor: Colors.green),
          onPressed: chosseNewWatchFace),
      // WatchFaceSelection(
      //     mywidget: const WatchFaceDigital01(mycolor: Colors.blue),
      //     onPressed: chosseNewWatchFace),
      WatchFaceSelection(
          mywidget: const WatchFaceAnalog01(), onPressed: chosseNewWatchFace),
    ];
  }

  void chosseNewWatchFace(Widget newWatchface) {
    setState(() {
      widget.updateWatchFace(newWatchface);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoopPageView.builder(
        controller: LoopPageController(initialPage: 0),
        scrollDirection: Axis.vertical,
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return pages[index];
        },
      ),
    );
  }
}
