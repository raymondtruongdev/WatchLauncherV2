// ignore_for_file: library_private_types_in_public_api

import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';

import 'clock_widget/widget_demo.dart';

import 'pages/page_installed_apps_v2.dart';
import 'pages/page_watchface.dart';

import 'utilts/get_app.dart';

Future<List<Application>> apps = GetApp.getInstalledApplications();
final PageController _pageController = PageController(initialPage: 1);
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
      // const WidgetTextCircle(text: 'PAGE1', color: Colors.green),
      WidgetTextButtonCircle(
          text: 'PAGE1',
          color: Colors.white,
          textButton: 'OPEN APP PAGE',
          onPressed: () {
            openAppPage();
          }),

      const PageWatchFace(),
      const WidgetTextCircle(text: 'PAGE3', color: Colors.blueAccent),
      // PageInstalledAppsV2(apps: apps),
      const WidgetTextCircle(text: 'PAGE4', color: Colors.green),
      WidgetTextButtonCircle(
          text: 'PAGE5',
          color: Colors.white,
          textButton: 'Add Page',
          onPressed: () {
            addNewPage();
          }),
    ];
  }

  void openAppPage() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PageInstalledAppsV2(apps: apps)));
  }

  void addNewPage() {
    // Add new page into pages list
    setState(() {
      pages.add(WidgetTextCircle(
          text: 'NEW PAGE (${pages.length + 1})', color: Colors.orange));

      // Go to the second page (index 1)
      _pageController.animateToPage(2,
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          // Handle the back button press
          final int currentPage = _pageController.page!.round();
          if (currentPage == 1) {
            openAppPage();
            return false; // Do not allow the system to pop the page
          }
          return true; // Allow the system to pop the page in other cases
        },
        child: PageView(
          controller: _pageController,
          children: pages,
        ),
      ),
    );
  }
}
