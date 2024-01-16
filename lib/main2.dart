import 'package:flutter/material.dart';

import 'package:loop_page_view/loop_page_view.dart';
import 'package:watchlauncher/pageWatchFaces.dart';
import 'package:watchlauncher/src/page_template.dart';
import 'package:watchlauncher/src/widget_demo.dart';

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
  List<Widget> pages = [];

  @override
  void initState() {
    super.initState();
    createPages();
  }

  void createPages() {
    pages = [
      const WidgetTextCircle(text: 'PAGE1', color: Colors.grey),
      const WidgetTextCircle(text: 'PAGE2', color: Colors.green),
      const PageList(),
      WidgetTextButtonCircle(
          text: 'PAGE4',
          color: Colors.white,
          textButton: 'Add Page',
          onPressed: () {
            addPage();
          }),
    ];
  }

  void addPage() {
    setState(() {
      pages.add(WidgetTextCircle(
          text: 'NEW PAGE (${pages.length + 1})', color: Colors.orange));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoopPageView.builder(
        controller: LoopPageController(initialPage: 3),
        scrollDirection: Axis.horizontal,
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return pages[index];
        },
      ),
    );
  }
}
