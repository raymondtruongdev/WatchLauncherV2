import 'package:flutter/material.dart';
import 'package:watchlauncher/src/page_template.dart';

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
