import 'package:flutter/material.dart';
import 'package:watch_launcher/template/page_template.dart';

class WatchFaceSelection extends StatefulWidget {
  final Widget mywidget;
  final Function onPressed;

  const WatchFaceSelection({
    Key? key,
    required this.mywidget,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<WatchFaceSelection> createState() => _WatchFaceSelectionState();
}

class _WatchFaceSelectionState extends State<WatchFaceSelection> {
  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      child: Center(
        child: Stack(
          children: [
            Transform.scale(
              scale: 0.8,
              alignment: Alignment.center,
              child: widget.mywidget,
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.only(bottom: 70),
              child: SizedBox(
                width: 110,
                height: 30,
                child: ElevatedButton(
                  onPressed: () {
                    widget.onPressed(widget.mywidget);
                  },
                  child: const Text(
                    'Select',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
