import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:watch_launcher/controller/controller.dart';
import 'package:watch_launcher/model/watchface_manager/model_watch_face.dart';
import 'package:watch_launcher/pages/page_installed_apps.dart';
import 'package:watch_launcher/utilts/logger_custom.dart';
import 'clock_widget/widget_demo.dart';
import 'pages/page_watchface.dart';

final PageController _pageController = PageController(initialPage: 1);
List<Widget> pages = [];
CustomLogger logger = CustomLogger();
final GlobalController globalController =
    Get.put(GlobalController(), permanent: true);
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      // Set value of Watch Size to Controller
      globalController.updateWatchSize(widthScreenDevice, heightScreenDevice);
      // Set the list of Watch Faces to controller
      globalController.setWatchFaceList(createWatchFaceList());
      // Set Index of Watch Face to show
      globalController.setIndexWatchFace(0);
      // Set page Installed Apps
      globalController.setPageInstalledApp(
          PageInstalledApps(apps: globalController.getInstalledAppList()));
    } else {}
    if ((widthScreenDevice > 0) && (heightScreenDevice > 0)) {
      // return const ChatPage();
      return const MaterialApp(
        home: MyHomePage(),
        debugShowCheckedModeBanner: false,
      );
    } else {
      // return const Center(child: Text('Loading......'));

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
    createPages();
  }

  void createPages() {
    // Make inital page list
    pages = [
      const WidgetTextCircleV2(
          // text: 'Wellness',
          color: Colors.green,
          imageBg: 'lib/assets/tempImages/tempWellness.png'),
      const PageWatchFace(),
      const WidgetTextCircleV2(
        text: 'Weather',
        color: Colors.red,
        imageBg: 'lib/assets/tempImages/tempWeather.png',
      ),
      // PageInstalledApps(apps: globalController.getInstalledAppList()),
      const WidgetTextCircleV2(
          // text: 'GoogleMap',
          color: Colors.green,
          imageBg: 'lib/assets/tempImages/tempGoogleMap.png'),
      const WidgetTextCircleV2(
          // text: 'Workout',
          color: Colors.green,
          imageBg: 'lib/assets/tempImages/tempLiveWorkout.png'),
      const WidgetTextCircleV2(
          // text: 'Music',
          color: Colors.green,
          imageBg: 'lib/assets/tempImages/tempMusic.png'),
      // WidgetTextButtonCircle(
      //     text: 'Comming Soon',
      //     color: Colors.white,
      //     textButton: 'Add Page',
      //     onPressed: () {
      //       addNewPage();
      //     }),
    ];
  }

  void addNewPage() {
    // Add new page into pages list
    setState(() {
      pages.add(WidgetTextCircle(
          text: 'NEW PAGE (${pages.length + 1})', color: Colors.orange));

      // Go to the second page (index 1)
      _pageController.animateToPage(2,
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get Size of device
    double widthScreenDevice = MediaQuery.of(context).size.width;
    double heightScreenDevice = MediaQuery.of(context).size.height;
    if ((widthScreenDevice > 0) && (heightScreenDevice > 0)) {
      logger.debug(
          'HomePage: Width: $widthScreenDevice, Height: $heightScreenDevice');
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
      body: WillPopScope(
        onWillPop: () async {
          // Handle the back button press
          final int currentPage = _pageController.page!.round();
          if (currentPage == 1) {
            openAppPage();
            return false; // Do not allow the system to pop the page
          }
          return true; // Allow the system to pop the page in other cases
        },
        child: PageView(
          controller: _pageController,
          children: pages,
        ),
      ),
    );
  }
}
