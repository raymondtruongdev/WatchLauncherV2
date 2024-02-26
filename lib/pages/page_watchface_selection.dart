// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loop_page_view/loop_page_view.dart';
import 'package:watch_launcher/controller/controller.dart';
import 'package:watch_launcher/template/page_template.dart';

class PageWatchFaceSelection extends StatelessWidget {
  const PageWatchFaceSelection({super.key});
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

class WatchFaceSelection extends StatelessWidget {
  final Widget mywidget;
  final int idWatch;

  const WatchFaceSelection({
    super.key,
    required this.mywidget,
    required this.idWatch,
  });

  @override
  Widget build(BuildContext context) {
    final GlobalController globalController =
        Get.put(GlobalController(), permanent: true);

    return GestureDetector(
      onTap: () {
        // Update new watchface index
        globalController.setIndexWatchFace(idWatch);
        // Back to watchface page
        Navigator.pop(context);
      },
      child: PageTemplate(
        child: Center(
          child: Stack(
            children: [
              Transform.scale(
                scale: 0.8,
                alignment: Alignment.center,
                child: mywidget,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
