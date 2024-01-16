// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: DigitalWatch(mycolor: Colors.red));
  }
}

class DigitalWatch extends StatefulWidget {
  final Color? mycolor; // Make color parameter optional

  const DigitalWatch({Key? key, this.mycolor = Colors.green}) : super(key: key);

  @override
  _DigitalWatchState createState() => _DigitalWatchState();
}

class _DigitalWatchState extends State<DigitalWatch> {
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
    return Container(
        width: 390.0,
        height: 390.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: widget.mycolor,
        ),
        child: Center(
            child: Text(_formatTime(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ))));
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
