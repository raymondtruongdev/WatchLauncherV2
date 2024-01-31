import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watch_launcher/controller/controller.dart';
import 'package:watch_launcher/pages/page_watchface_selection.dart';

class PageWatchFace extends StatelessWidget {
  const PageWatchFace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalController globalController =
        Get.put(GlobalController(), permanent: true);

    return Obx(
      () {
        int idxWatchFace = globalController.getIndexWatchFace().value;
        List<Widget> watchFaceList = globalController.getWatchFaceList();
        Widget newWatch = watchFaceList[idxWatchFace];

        return GestureDetector(
          onLongPress: () {
            // Handle long press here
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PageWatchFaceSelection(
                  updateWatchFace: globalController.setIndexWatchFace,
                ),
              ),
            );
          },
          child: newWatch,
        );
      },
    );
  }
}
