import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watch_launcher/controller.dart';

class PageTemplate extends StatelessWidget {
  final Widget child;
  final Color color;

  // Constructor
  const PageTemplate({Key? key, required this.child, this.color = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalController globalController =
        Get.put(GlobalController(), permanent: true);

    double widthScreen = MediaQuery.of(context).size.width;
    globalController.updateWatchSize(widthScreen);
    double watchSize = (globalController.getWatchSize().value);

    return Scaffold(
      backgroundColor: color,
      body: Center(
        child: ClipOval(
          child: SizedBox(
            width: watchSize,
            height: watchSize,
            child: child,
          ),
        ),
      ),
    );
  }
}
