// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loop_page_view/loop_page_view.dart';
import 'package:watch_launcher/controller/controller.dart';
import 'package:watch_launcher/template/page_template.dart';

class PageWatchFaceSelection extends StatefulWidget {
  final Function updateWatchFace;

  const PageWatchFaceSelection({Key? key, required this.updateWatchFace})
      : super(key: key);

  @override
  _PageWatchFaceSelectionState createState() => _PageWatchFaceSelectionState();
}

class _PageWatchFaceSelectionState extends State<PageWatchFaceSelection> {
  List<Widget> pages = [];

  @override
  void initState() {
    super.initState();
  }

  void chosseNewWatchFace(Widget newWatchface) {
    setState(() {
      widget.updateWatchFace(newWatchface);
    });
  }

  @override
  Widget build(BuildContext context) {
    final GlobalController globalController =
        Get.put(GlobalController(), permanent: true);
    List<Widget> watchFaceList = globalController.getWatchFaceList();
    List<Widget> watchFaceSelection = createWatchFaceSelection(watchFaceList);
    int indexWatchFaceCurrent = globalController.getIndexWatchFace().value;

    return Scaffold(
      body: LoopPageView.builder(
        controller: LoopPageController(initialPage: indexWatchFaceCurrent),
        scrollDirection: Axis.vertical,
        itemCount: watchFaceSelection.length,
        itemBuilder: (context, index) {
          return watchFaceSelection[index];
        },
      ),
    );
  }
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

class WatchFaceSelection extends StatefulWidget {
  final Widget mywidget;
  final int idWatch;

  const WatchFaceSelection({
    Key? key,
    required this.mywidget,
    required this.idWatch,
  }) : super(key: key);

  @override
  State<WatchFaceSelection> createState() => _WatchFaceSelectionState();
}

class _WatchFaceSelectionState extends State<WatchFaceSelection> {
  @override
  Widget build(BuildContext context) {
    final GlobalController globalController =
        Get.put(GlobalController(), permanent: true);

    return PageTemplate(
      child: Center(
        child: Stack(
          children: [
            Transform.scale(
              scale: 0.8,
              alignment: Alignment.center,
              child: widget.mywidget,
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.only(bottom: 70),
              child: SizedBox(
                width: 110,
                height: 30,
                child: ElevatedButton(
                  onPressed: () {
                    // Update new watchface index
                    globalController.setIndexWatchFace(widget.idWatch);
                    // Back to watchface page
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Select',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
