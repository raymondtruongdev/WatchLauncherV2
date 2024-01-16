import 'package:flutter/material.dart';
import 'package:loop_page_view/loop_page_view.dart';
import 'package:watchlauncher/src/widget_demo.dart';

class PageList extends StatefulWidget {
  const PageList({Key? key}) : super(key: key);

  @override
  _PageListState createState() => _PageListState();
}

class _PageListState extends State<PageList> {
  List<Widget> pages = [];

  @override
  void initState() {
    super.initState();
    createPages();
  }

  void createPages() {
    pages = [
      const WidgetTextSquare(text: 'WATCHFACE 01', color: Colors.red),
      const WidgetTextSquare(text: 'WATCHFACE 02', color: Colors.green),
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
