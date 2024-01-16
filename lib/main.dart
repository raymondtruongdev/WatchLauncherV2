// ignore_for_file: library_private_types_in_public_api

import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:loop_page_view/loop_page_view.dart';
import 'package:watchlauncher/pages/page_watchface.dart';
import 'package:watchlauncher/pages/page_installed_apps.dart';
import 'package:watchlauncher/src/get_app.dart';
import 'package:watchlauncher/src/widget_demo.dart';

Future<List<Application>> apps = GetApp.getInstalledApplications();
List<Widget> pages = [];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'ScrollConfiguration Demo',
      home: MyHomePage(),
    );
  }
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoopPageView.builder(
        controller: LoopPageController(initialPage: 2),
        scrollDirection: Axis.horizontal,
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return pages[index];
        },
      ),
    );
  }
}
