import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watch_launcher/controller/controller.dart';
import 'package:watch_launcher/template/page_template.dart';

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
