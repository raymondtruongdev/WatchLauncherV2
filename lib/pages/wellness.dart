import 'package:flutter/material.dart';

import '../clock_widget/widget_demo.dart';

class WellNess extends StatefulWidget {
  const WellNess({super.key});

  @override
  State<WellNess> createState() => _WellNessState();
}

class _WellNessState extends State<WellNess> {
  @override
  Widget build(BuildContext context) {
    return const WidgetTextCircle(text: 'WELLNESS', color: Colors.red);
  }
}

class TextCustom extends StatelessWidget {
  const TextCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipOval(
        child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.blueGrey[300],
            child: const Center(
                child:
                    Text('WELLNESS', style: TextStyle(color: Colors.black)))),
      ),
    );
  }
}
