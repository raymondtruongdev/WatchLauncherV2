// ignore_for_file: library_private_types_in_public_api

import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:loop_page_view/loop_page_view.dart';

import 'clock_widget/widget_demo.dart';
import 'pages/page_installed_apps.dart';
import 'pages/page_watchface.dart';
import 'utilts/get_app.dart';

Future<List<Application>> apps = GetApp.getInstalledApplications();
final LoopPageController _loopPageController = LoopPageController(
    initialPage: 3,
    scrollMode: LoopScrollMode.shortest,
    activationMode: LoopActivationMode.immediate);
List<Widget> pages = [];

void main() {
  // runApp(const MyHomePage());

  runApp(const MaterialApp(home: MyHomePage()));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    createPages();
  }

  void createPages() {
    // Make inital page list
    pages = [
      const WidgetTextCircle(text: 'PAGE1', color: Colors.grey),
      PageInstalledApps(apps: apps),
      // const WidgetTextCircle(text: 'PAGE2', color: Colors.blueAccent),
      const PageWatchFace(),
      // const WatchFaceDigital01(mycolor: Colors.red),
      WidgetTextButtonCircle(
          text: 'PAGE4',
          color: Colors.white,
          textButton: 'Add Page',
          onPressed: () {
            addNewPage();
          }),
    ];
  }

  void addNewPage() {
    // Add new page into pages list
    setState(() {
      pages.add(WidgetTextCircle(
          text: 'NEW PAGE (${pages.length + 1})', color: Colors.orange));

      // Go to the second page (index 1)
      _loopPageController.animateToPage(
        2,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoopPageView.builder(
        controller: _loopPageController,
        scrollDirection: Axis.horizontal,
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return pages[index];
        },
      ),
    );
  }
}
