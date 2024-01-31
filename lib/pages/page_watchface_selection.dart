// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loop_page_view/loop_page_view.dart';
import 'package:watch_launcher/controller/controller.dart';
import 'package:watch_launcher/model/watchface_manager/model_watch_face.dart';

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
