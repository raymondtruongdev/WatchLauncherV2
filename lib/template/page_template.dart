import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watch_launcher/controller/controller.dart';

class PageTemplate extends StatelessWidget {
  final Widget child;
  final Color color;

  // Constructor
  const PageTemplate(
      {super.key, required this.child, this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    final GlobalController globalController =
        Get.put(GlobalController(), permanent: true);

    double watchSize = (globalController.getWatchSize());

    return Scaffold(
      backgroundColor: globalController.isCircleDevice() ? Colors.black : color,
      body: Center(
        child: ClipOval(
          child: Container(
            color: globalController.isCircleDevice() ? Colors.black : color,
            width: watchSize,
            height: watchSize,
            child: child,
          ),
        ),
      ),
    );
  }
}
