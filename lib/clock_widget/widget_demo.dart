import 'package:flutter/material.dart';
import '../template/page_template.dart';

class WidgetTextButtonCircle extends StatelessWidget {
  final String text;
  final Color color;
  final Function onPressed;
  final String textButton;

  const WidgetTextButtonCircle(
      {super.key,
      required this.text,
      required this.color,
      required this.onPressed,
      required this.textButton});

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
  const WidgetTextCircle({super.key, required this.text, required this.color});

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
      {super.key, this.text = '', required this.color, this.imageBg = ''});

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
              image: imageBg.isNotEmpty
                  ? DecorationImage(
                      image: AssetImage(imageBg),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: Center(
              child: text.isNotEmpty
                  ? Text(
                      text,
                      style: const TextStyle(color: Colors.black),
                    )
                  : null,
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
  const WidgetTextSquare({super.key, required this.text, required this.color});

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
