import 'package:flutter/material.dart';

class PageTemplate extends StatelessWidget {
  final Widget child;

  // Constructor
  const PageTemplate({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double maxScreen = 384;
    double widthScreen = MediaQuery.of(context).size.width;
    double watchSize = widthScreen.clamp(0, maxScreen);
    // watchSize = 300;

    return Scaffold(
      backgroundColor: Colors.black,
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
