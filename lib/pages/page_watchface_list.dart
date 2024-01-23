// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:loop_page_view/loop_page_view.dart';
import 'package:watch_launcher/clock_widget/WatchFaceAnalog01/wf_analog_01.dart';
import 'package:watch_launcher/clock_widget/WatchFaceDigital01/wf_digital_01.dart';
import 'package:watch_launcher/pages/page_watchface_selection.dart';

import '../clock_widget/widget_demo.dart';

class PageWatchFaceList extends StatefulWidget {
  const PageWatchFaceList({Key? key}) : super(key: key);

  @override
  _PageWatchFaceListState createState() => _PageWatchFaceListState();
}

class _PageWatchFaceListState extends State<PageWatchFaceList> {
  List<Widget> pages = [];

  @override
  void initState() {
    super.initState();
    createPages();
  }

  void createPages() {
    pages = [
      const PageWatchFaceSelection(
          mywiget: WatchFaceDigital01(mycolor: Colors.red)),
      const PageWatchFaceSelection(
          mywiget: WatchFaceDigital01(mycolor: Colors.green)),
      const PageWatchFaceSelection(
          mywiget: WatchFaceDigital01(mycolor: Colors.blue)),
      const PageWatchFaceSelection(mywiget: WatchFaceAnalog01()),
      const WidgetTextSquare(text: 'WATCHFACE 03', color: Colors.blue),
      WidgetTextButtonCircle(
        text: 'WATCHFACE 04',
        color: Colors.grey,
        textButton: 'Add WATCHFACE',
        onPressed: () {
          addPage();
        },
      ),
    ];
  }

  void addPage() {
    setState(() {
      pages.add(WidgetTextSquare(
          text: ' WATCHFACE (${pages.length + 1})', color: Colors.orange));
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
