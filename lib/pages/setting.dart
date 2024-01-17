import 'package:flutter/material.dart';

import '../clock_widget/widget_demo.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return const WidgetTextCircle(text: 'SETTING', color: Colors.grey);
  }
}

class TextScreen extends StatelessWidget {
  const TextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: ClipOval(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.yellow[300],
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Setting', style: TextStyle(color: Colors.black)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
