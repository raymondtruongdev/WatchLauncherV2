// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:watchlauncher/src/page_template.dart';

// WatchFaceDigital01(mycolor: Colors.red)

class WatchFaceDigital01 extends StatefulWidget {
  final Color? mycolor; // Make color parameter optional

  const WatchFaceDigital01({Key? key, this.mycolor = Colors.green})
      : super(key: key);

  @override
  _WatchFaceDigital01State createState() => _WatchFaceDigital01State();
}

class _WatchFaceDigital01State extends State<WatchFaceDigital01> {
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
    return PageTemplate(
      child: ClipOval(
        child: Center(
          child: Container(
              width: double.infinity,
              height: double.infinity,
              color: widget.mycolor,
              child: Center(
                  child: Text(_formatTime(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      )))),
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
