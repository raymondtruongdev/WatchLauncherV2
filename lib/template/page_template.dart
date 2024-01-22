import 'package:flutter/material.dart';

class PageTemplate extends StatelessWidget {
  final Widget child;
  final Color color;

  // Constructor
  const PageTemplate({Key? key, required this.child, this.color = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double maxScreen = 384;
    double widthScreen = MediaQuery.of(context).size.width;
    double watchSize = widthScreen.clamp(0, maxScreen);
    // watchSize = 300;
    // print(MediaQuery.of(context).size.width);
    // print(MediaQuery.of(context).size.height);

    return Scaffold(
      backgroundColor: color,
      body: Center(
        child: ClipOval(
          child: SizedBox(
            width: watchSize,
            height: watchSize,
            child: child,
          ),
        ),
      ),
    );
  }
}
