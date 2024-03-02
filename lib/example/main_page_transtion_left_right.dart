// PageView : slide to change page1, page2, page3
// Default page is page2
// Press Home Button if current page is page2 do not thing ( not re-render)

import 'package:flutter/material.dart';

final PageController _pageController = PageController(
  initialPage: 1,
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Page0(),
    );
  }
}

class Page0 extends StatelessWidget {
  const Page0({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) {
          if (!didPop) {
            // Handle the back button press
            final int currentPage = _pageController.page!.round();
            if (currentPage == 1) {
              // We init page index==1 (Page2) of _pageController list is the first element of Stack ,
              // So in case last item in Stack is 1 we do not allow user to do Pop and close app
            } else {
              // In case the current page IS NOT Page2 we will open Page2
              _pageController.animateToPage(1,
                  duration: const Duration(milliseconds: 5),
                  curve: Curves.easeOut);
            }
          }
        },
        child: PageView(
          controller: _pageController,
          children: const <Widget>[
            Page1(),
            Page2(),
            Page3(),
          ],
        ),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
      ),
      body: Container(
        color: Colors.red,
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              _pageController.jumpToPage(2);
            },
            child: const Text('Go to Page 3'),
          ),
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 2'),
      ),
      body: Container(
        color: Colors.green,
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              _pageController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.linear,
              );
            },
            child: const Text('Go back to Page 1'),
          ),
        ),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 3'),
      ),
      body: Container(
        color: Colors.blue,
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              _pageController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.linear,
              );
            },
            child: const Text('Go back to Page 2'),
          ),
        ),
      ),
    );
  }
}
