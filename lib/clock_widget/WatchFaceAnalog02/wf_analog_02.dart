import 'package:flutter/material.dart';
import '../../template/page_template.dart';
import 'clock_analog_02.dart';

class WatchFaceAnalog02 extends StatefulWidget {
  const WatchFaceAnalog02({super.key});

  @override
  State<WatchFaceAnalog02> createState() => _WatchFaceAnalog02State();
}

class _WatchFaceAnalog02State extends State<WatchFaceAnalog02> {
  @override
  Widget build(BuildContext context) {
    return const ClockScreen();
  }
}

class ClockScreen extends StatelessWidget {
  const ClockScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    'lib/clock_widget/WatchFaceAnalog02/background.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: const Center(
                child: Stack(alignment: Alignment.center, children: <Widget>[
              ClockAnalog02(),
            ])),
          ),
        ),
      ),
    );
  }
}
