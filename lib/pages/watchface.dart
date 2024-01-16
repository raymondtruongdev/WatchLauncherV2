import 'package:flutter/material.dart';
import 'package:watch_launcher/clock_widget/WatchFaceAnalog01/complication.dart';
import 'package:watch_launcher/clock_widget/clock_analog_01.dart';

class WatchFace extends StatefulWidget {
  const WatchFace({super.key});

  @override
  State<WatchFace> createState() => _WatchFaceState();
}

class _WatchFaceState extends State<WatchFace> {
  @override
  Widget build(BuildContext context) {
    return const ClockScreen();
  }
}

class ClockScreen extends StatelessWidget {
  const ClockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var complicationBattery = CircleComplication(
        title: 'Battery',
        value: '10%',
        percentage: 0.10,
        radius: 40,
        icon: Icons.battery_full,
        gaugeColor: GaugeColor(
            bgColorInside: const Color(0xff012340),
            bgColorOutside: const Color(0xff012340),
            bgColorValue: const Color(0xff028CFF)));
    var complicationStep = CircleComplication(
      title: 'Step',
      value: '5000',
      percentage: 0.53,
      radius: 40,
      icon: Icons.nordic_walking_sharp,
      gaugeColor: GaugeColor(
          bgColorInside: const Color(0xff0A3E19),
          bgColorOutside: const Color(0xff146327),
          bgColorValue: const Color(0xff31F965)),
    );

    var complicationHr = CircleComplication(
      title: 'HR',
      value: '80',
      percentage: 1.0,
      radius: 40,
      icon: Icons.heart_broken,
      gaugeColor: GaugeColor(
          bgColorInside: const Color.fromARGB(255, 245, 136, 136),
          bgColorOutside: const Color.fromARGB(255, 185, 52, 52),
          bgColorValue: const Color.fromARGB(255, 245, 136, 136)),
    );

    double maxScreen = 384;
    double widthScreen = MediaQuery.of(context).size.width;
    double watchSize = widthScreen.clamp(0, maxScreen);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: ClipOval(
          child: Container(
            width: watchSize,
            height: watchSize,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/wf_bg_01.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
                child: Stack(alignment: Alignment.center, children: <Widget>[
              // Image.asset('assets/wf_bg_01.png'), // Clock face image
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()..translate(0.0, 80.0),
                child: complicationBattery, // Clock hand image
              ),
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()..translate(-80.0, 0.0),
                child: complicationStep, // Clock hand image
              ),
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()..translate(80.0, 0.0),
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
