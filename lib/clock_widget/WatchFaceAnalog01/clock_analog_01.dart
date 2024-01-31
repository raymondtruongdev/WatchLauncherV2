import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class ClockAnalog01 extends StatefulWidget {
  const ClockAnalog01({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ClockAnalog01State createState() => _ClockAnalog01State();
}

class _ClockAnalog01State extends State<ClockAnalog01> {
  late Timer _timer;
  late DateTime _dateTime;

  @override
  void initState() {
    super.initState();
    _dateTime = DateTime.now();
    _timer =
        Timer.periodic(const Duration(seconds: 1), (Timer t) => _updateTime());
  }

  void _updateTime() {
    setState(() {
      _dateTime = DateTime.now();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const pivotOffsetMinute = Offset(0, 0);
    const pivotOffsetSecond = Offset(0, 0);
    const pivotOffsetHour = Offset(0, 0);
    var secondAngle = _dateTime.second * 6.0 * pi / 180;
    var minuteAngle =
        (_dateTime.minute * 6 + _dateTime.second * 0.1) * 0.0174533;
    final hourAngle =
        (_dateTime.hour * 30 + _dateTime.minute * 0.5) * 0.0174533; // Hour hand

    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..rotateZ(hourAngle)
            ..translate(-pivotOffsetHour.dx, -pivotOffsetHour.dy),
          child: Image.asset(
              'lib/clock_widget/WatchFaceAnalog01/image/hour_hand.png'), // Clock hand image
        ),
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..rotateZ(minuteAngle)
            ..translate(-pivotOffsetMinute.dx, -pivotOffsetMinute.dy),
          child: Image.asset(
              'lib/clock_widget/WatchFaceAnalog01/image/minute_hand.png'), // Clock hand image
        ),
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..rotateZ(secondAngle)
            ..translate(-pivotOffsetSecond.dx, -pivotOffsetSecond.dy),
          child: Image.asset(
              'lib/clock_widget/WatchFaceAnalog01/image/second_hand.png'), // Clock hand image
        ),
      ],
    );
  }
}
