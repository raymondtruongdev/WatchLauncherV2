import 'package:flutter/material.dart';
import 'package:watch_launcher/template/page_template.dart';

class PageWatchFaceSelection extends StatefulWidget {
  final Widget mywiget;
  const PageWatchFaceSelection({super.key, required this.mywiget});

  @override
  State<PageWatchFaceSelection> createState() => _PageWatchFaceSelectionState();
}

class _PageWatchFaceSelectionState extends State<PageWatchFaceSelection> {
  @override
  Widget build(BuildContext context) {
    return PageTemplate(
        child: Center(
      child: Stack(
        children: [
          Center(child: widget.mywiget),
          Container(
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.only(bottom: 50),
              child: SizedBox(
                width: 150,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // onPressed();
                  },
                  child: const Text('Select',
                      style: TextStyle(color: Colors.black, fontSize: 20)),
                ),
              ))
        ],
      ),
    ));
  }
}
