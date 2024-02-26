// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:watch_launcher/controller/controller.dart';

import '../../template/page_template.dart';

// WatchFaceDigital02(mycolor: Colors.red)

class WatchFaceDigital02 extends StatefulWidget {
  final Color? mycolor; // Make color parameter optional

  const WatchFaceDigital02({Key? key, this.mycolor = Colors.green})
      : super(key: key);

  @override
  _WatchFaceDigital02State createState() => _WatchFaceDigital02State();
}

class _WatchFaceDigital02State extends State<WatchFaceDigital02> {
  late Timer _timer;
  late DateTime _currentTime;

  @override
  void initState() {
    super.initState();
    _currentTime = DateTime.now();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        _currentTime = DateTime.now();
      });
    });
  }

  String _formatTime() {
    return DateFormat('HH:mm:ss').format(_currentTime);
  }

  @override
  Widget build(BuildContext context) {
    // Set scaleRatio to fix mutiple  screen size
    final GlobalController globalController =
        Get.put(GlobalController(), permanent: true);

    double watchSize = (globalController.getWatchSize());

    double scaleRatio = watchSize / 390;

    // Format for extracting hour and minute
    final hourMinuteFormat = DateFormat('h:mm a');

    // Format for extracting AM/PM
    final amPmFormat = DateFormat('a');
    // Extract hour and minute
    String hourMinute = hourMinuteFormat.format(_currentTime);
    int hour = int.parse(hourMinute.split(':')[0]);
    int minute = int.parse(hourMinute.split(':')[1].split(' ')[0]);

    // Extract AM/PM
    String amPm = amPmFormat.format(_currentTime);

    return PageTemplate(
      child: ClipOval(
        child: Center(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'lib/clock_widget/WatchFaceDigital02/image/background.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              // Change to Column
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // Align at the bottom and top
              children: [
                Flexible(
                  flex: 1,
                  child: Container(), // Empty container for spacing
                ),
                Flexible(
                  flex: 4,
                  child: Text(
                    hour.toString().padLeft(2, '0'),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 130.0 * scaleRatio,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Flexible(
                  flex: 4,
                  child: Text(
                    minute.toString().padLeft(2, '0'),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 110.0 * scaleRatio,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Text(
                    amPm,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0 * scaleRatio,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(), // Empty container for spacing
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
