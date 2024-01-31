import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watch_launcher/clock_widget/Complication01/complication01.dart';
import 'package:watch_launcher/clock_widget/WatchFaceAnalog01/clock_analog_01.dart';
import 'package:watch_launcher/controller/controller.dart';

import '../../template/page_template.dart';

class WatchFaceAnalog01 extends StatefulWidget {
  const WatchFaceAnalog01({super.key});

  @override
  State<WatchFaceAnalog01> createState() => _WatchFaceAnalog01State();
}

class _WatchFaceAnalog01State extends State<WatchFaceAnalog01> {
  @override
  Widget build(BuildContext context) {
    return const ClockScreen();
  }
}

class ClockScreen extends StatelessWidget {
  const ClockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalController globalController =
        Get.put(GlobalController(), permanent: true);

    double watchSize = (globalController.getWatchSize().value);

    double scaleRatio = watchSize / 390;

    var complicationBattery = CircleComplication(
        title: 'Battery',
        value: '80%',
        percentage: 0.10,
        radius: 40 * scaleRatio,
        // icon: Icons.battery_full,
        imagePath: 'lib/clock_widget/Complication01/image/battery.svg',
        gaugeColor: GaugeColor(
            bgColorInside: const Color(0xff0A3E19),
            bgColorOutside: const Color(0xff146327),
            bgColorValue: const Color(0xff31F965)));

    var complicationStep = CircleComplication(
        title: 'Step',
        value: '5000',
        percentage: 0.53,
        radius: 40 * scaleRatio,
        // icon: Icons.nordic_walking_sharp,
        imagePath: 'lib/clock_widget/Complication01/image/step.svg',
        gaugeColor: GaugeColor(
            bgColorInside: const Color(0xff012340),
            bgColorOutside: const Color(0xff012340),
            bgColorValue: const Color(0xff028CFF)));

    var complicationHr = CircleComplication(
        title: 'HR',
        value: '80',
        percentage: 1.0,
        radius: 40 * scaleRatio,
        imagePath: 'lib/clock_widget/Complication01/image/heartrate.svg',
        gaugeColor: GaugeColor(
            bgColorInside: const Color(0xff373740),
            bgColorOutside: const Color(0xff888760),
            bgColorValue: const Color(0xffFFE61E)));

    return Scaffold(
      backgroundColor: Colors.black,
      body: PageTemplate(
        child: ClipOval(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'lib/clock_widget/WatchFaceAnalog01/image/background.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
                child: Stack(alignment: Alignment.center, children: <Widget>[
              // Image.asset('assets/wf_bg_01.png'), // Clock face image
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..translate(0.0, 80.0 * scaleRatio),
                child: complicationBattery, // Clock hand image
              ),
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..translate(-80.0 * scaleRatio, 0.0),
                child: complicationStep, // Clock hand image
              ),
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..translate(80.0 * scaleRatio, 0.0),
                child: complicationHr, // Clock hand image
              ),
              const ClockAnalog01(),
            ])),
          ),
        ),
      ),
    );
  }
}
