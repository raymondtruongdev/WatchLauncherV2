import 'package:app_install_events/app_install_events.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watch_launcher/controller/controller.dart';
import 'package:watch_launcher/model/watchface_manager/model_watch_face.dart';
import 'package:watch_launcher/pages/page_installed_apps.dart';
import 'package:watch_launcher/utilts/logger_custom.dart';

final PageController _pageController = PageController(initialPage: 1);
// List<Widget> pages = [];
CustomLogger logger = CustomLogger();
final GlobalController globalController =
    Get.put(GlobalController(), permanent: true);
void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AppIUEvents _appIUEvents;
  @override
  void initState() {
    _appIUEvents = AppIUEvents();

    _appIUEvents.appEvents.listen((event) {
      globalController.updateInstalledAppList();
      if (event.type == IUEventType.installed) {
        print('App installed: ${event.packageName}');
      } else {
        print('App uninstalled: ${event.packageName}');
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _appIUEvents.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Set immersive system UI mode for Android (full screen)
    //- However it will make 2 times init app
    // --> can not fix this issue now

    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    // Get Size of device
    double widthScreenDevice = MediaQuery.of(context).size.width;
    double heightScreenDevice = MediaQuery.of(context).size.height;
    if ((widthScreenDevice > 0) && (heightScreenDevice > 0)) {
      return const MaterialApp(
        home: MyHomePage(),
        debugShowCheckedModeBanner: false,
      );
    } else {
      return const MaterialApp(
        home: Scaffold(
          body: Center(child: Text('Loading......')),
        ),
        debugShowCheckedModeBanner: false,
      );
    }
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Get Size of device
    double widthScreenDevice = MediaQuery.of(context).size.width;
    double heightScreenDevice = MediaQuery.of(context).size.height;
    if ((widthScreenDevice > 0) && (heightScreenDevice > 0)) {
      logger.debug(
          'HomePage: Width: $widthScreenDevice, Height: $heightScreenDevice');
      // Set value of Watch Size to Controller
      globalController.updateWatchSize(widthScreenDevice, heightScreenDevice);
      // Set the list of Watch Faces to controller
      globalController.setWatchFaceList(createWatchFaceList());
      // Set Index of Watch Face to show
      globalController.setIndexWatchFace(0);
      // Set page Installed Apps
      globalController.setPageInstalledApp();

      globalController.createLauncherPages();
    } else {
      logger.error(
          'HomePage: Width: $widthScreenDevice, Height: $heightScreenDevice');
    }

    void openAppPage() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => globalController.getPageInstalledApp()));
    }

    return Scaffold(
      body: PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) {
          if (!didPop) {
            // Handle the back button press
            final int currentPage = _pageController.page!.round();
            // In case the current page is Watchface we will open Installed Apps Page
            if (currentPage == 1) {
              openAppPage();
            } else {
              // In case the current page IS NOT a Watchface we will open WatchFace
              _pageController.animateToPage(1,
                  duration: const Duration(milliseconds: 5),
                  curve: Curves.easeOut);
            }
          }
        },
        child: PageView(
          controller: _pageController,
          children: globalController.launcherPages,
        ),
      ),
    );
  }
}
