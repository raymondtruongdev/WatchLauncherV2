import 'package:flutter/material.dart';

import '../template/page_template.dart';

class WidgetTextButtonCircle extends StatelessWidget {
  final String text;
  final Color color;
  final Function onPressed;
  final String textButton;

  const WidgetTextButtonCircle(
      {Key? key,
      required this.text,
      required this.color,
      required this.onPressed,
      required this.textButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      child: Center(
        child: ClipOval(
          child: Container(
              width: double.infinity,
              height: double.infinity,
              color: color,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: Text(text,
                            style: const TextStyle(color: Colors.black))),
                    const SizedBox(height: 30),
                    Center(
                        child: ElevatedButton(
                      onPressed: () {
                        onPressed();
                      },
                      child: Text(textButton),
                    ))
                  ],
                ),
              )),
        ),
      ),
    );
  }
}

class WidgetTextCircle extends StatelessWidget {
  final String text;
  final Color color;
  const WidgetTextCircle({Key? key, required this.text, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      child: Center(
        child: ClipOval(
          child: Container(
              width: double.infinity,
              height: double.infinity,
              color: color,
              child: Center(
                  child:
                      Text(text, style: const TextStyle(color: Colors.black)))),
        ),
      ),
    );
  }
}

class WidgetTextCircleV2 extends StatelessWidget {
  final String text;
  final Color color;
  final String imageBg;
  const WidgetTextCircleV2(
      {Key? key, required this.text, required this.color, this.imageBg = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // String imageBg = 'lib/assets/tempImages/tempWeather.png';

    return PageTemplate(
      child: Center(
        child: ClipOval(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 2.0,
              ),
              image: imageBg.isNotEmpty
                  ? DecorationImage(
                      image: AssetImage(imageBg),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class WidgetTextSquare extends StatelessWidget {
  final String text;
  final Color color;
  const WidgetTextSquare({Key? key, required this.text, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      child: Center(
        child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
            child: Center(
              child: Container(
                width: 200,
                height: 200,
                color: color,
                child: Center(
                    child: Text(text,
                        style: const TextStyle(color: Colors.black))),
              ),
            )),
      ),
    );
  }
}
